package com.obee.sensation

import org.springframework.dao.DataIntegrityViolationException

class CocktailController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [cocktailInstanceList: Cocktail.list(params), cocktailInstanceTotal: Cocktail.count()]
    }

    def create() {
        [cocktailInstance: new Cocktail(params)]
    }

    def save() {
        def cocktailInstance = new Cocktail(params)
        if (!cocktailInstance.save(flush: true)) {
            render(view: "create", model: [cocktailInstance: cocktailInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cocktail.label', default: 'Cocktail'), cocktailInstance.id])
        redirect(action: "show", id: cocktailInstance.id)
    }

    def show(Long id) {
        def cocktailInstance = Cocktail.get(id)
        if (!cocktailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cocktail.label', default: 'Cocktail'), id])
            redirect(action: "list")
            return
        }

        [cocktailInstance: cocktailInstance]
    }

    def edit(Long id) {
        def cocktailInstance = Cocktail.get(id)
        if (!cocktailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cocktail.label', default: 'Cocktail'), id])
            redirect(action: "list")
            return
        }

        [cocktailInstance: cocktailInstance]
    }

    def update(Long id, Long version) {
        def cocktailInstance = Cocktail.get(id)
        if (!cocktailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cocktail.label', default: 'Cocktail'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cocktailInstance.version > version) {
                cocktailInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cocktail.label', default: 'Cocktail')] as Object[],
                          "Another user has updated this Cocktail while you were editing")
                render(view: "edit", model: [cocktailInstance: cocktailInstance])
                return
            }
        }

        cocktailInstance.properties = params

        if (!cocktailInstance.save(flush: true)) {
            render(view: "edit", model: [cocktailInstance: cocktailInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cocktail.label', default: 'Cocktail'), cocktailInstance.id])
        redirect(action: "show", id: cocktailInstance.id)
    }

    def delete(Long id) {
        def cocktailInstance = Cocktail.get(id)
        if (!cocktailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cocktail.label', default: 'Cocktail'), id])
            redirect(action: "list")
            return
        }

        try {
            cocktailInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cocktail.label', default: 'Cocktail'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cocktail.label', default: 'Cocktail'), id])
            redirect(action: "show", id: id)
        }
    }
}
