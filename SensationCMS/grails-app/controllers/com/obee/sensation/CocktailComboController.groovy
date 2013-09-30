package com.obee.sensation

import org.springframework.dao.DataIntegrityViolationException

class CocktailComboController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [cocktailComboInstanceList: CocktailCombo.list(params), cocktailComboInstanceTotal: CocktailCombo.count()]
    }

    def create() {
        [cocktailComboInstance: new CocktailCombo(params)]
    }

    def save() {
        def cocktailComboInstance = new CocktailCombo(params)
        if (!cocktailComboInstance.save(flush: true)) {
            render(view: "create", model: [cocktailComboInstance: cocktailComboInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cocktailCombo.label', default: 'CocktailCombo'), cocktailComboInstance.id])
        redirect(action: "show", id: cocktailComboInstance.id)
    }

    def show(Long id) {
        def cocktailComboInstance = CocktailCombo.get(id)
        if (!cocktailComboInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cocktailCombo.label', default: 'CocktailCombo'), id])
            redirect(action: "list")
            return
        }

        [cocktailComboInstance: cocktailComboInstance]
    }

    def edit(Long id) {
        def cocktailComboInstance = CocktailCombo.get(id)
        if (!cocktailComboInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cocktailCombo.label', default: 'CocktailCombo'), id])
            redirect(action: "list")
            return
        }

        [cocktailComboInstance: cocktailComboInstance]
    }

    def update(Long id, Long version) {
        def cocktailComboInstance = CocktailCombo.get(id)
        if (!cocktailComboInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cocktailCombo.label', default: 'CocktailCombo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cocktailComboInstance.version > version) {
                cocktailComboInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cocktailCombo.label', default: 'CocktailCombo')] as Object[],
                          "Another user has updated this CocktailCombo while you were editing")
                render(view: "edit", model: [cocktailComboInstance: cocktailComboInstance])
                return
            }
        }

        cocktailComboInstance.properties = params

        if (!cocktailComboInstance.save(flush: true)) {
            render(view: "edit", model: [cocktailComboInstance: cocktailComboInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cocktailCombo.label', default: 'CocktailCombo'), cocktailComboInstance.id])
        redirect(action: "show", id: cocktailComboInstance.id)
    }

    def delete(Long id) {
        def cocktailComboInstance = CocktailCombo.get(id)
        if (!cocktailComboInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cocktailCombo.label', default: 'CocktailCombo'), id])
            redirect(action: "list")
            return
        }

        try {
            cocktailComboInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cocktailCombo.label', default: 'CocktailCombo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cocktailCombo.label', default: 'CocktailCombo'), id])
            redirect(action: "show", id: id)
        }
    }
}
