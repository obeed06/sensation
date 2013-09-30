package com.obee.sensation

import org.springframework.dao.DataIntegrityViolationException

class ProductVolumeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [productVolumeInstanceList: ProductVolume.list(params), productVolumeInstanceTotal: ProductVolume.count()]
    }

    def create() {
        [productVolumeInstance: new ProductVolume(params)]
    }

    def save() {
        def productVolumeInstance = new ProductVolume(params)
        if (!productVolumeInstance.save(flush: true)) {
            render(view: "create", model: [productVolumeInstance: productVolumeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'productVolume.label', default: 'ProductVolume'), productVolumeInstance.id])
        redirect(action: "show", id: productVolumeInstance.id)
    }

    def show(Long id) {
        def productVolumeInstance = ProductVolume.get(id)
        if (!productVolumeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productVolume.label', default: 'ProductVolume'), id])
            redirect(action: "list")
            return
        }

        [productVolumeInstance: productVolumeInstance]
    }

    def edit(Long id) {
        def productVolumeInstance = ProductVolume.get(id)
        if (!productVolumeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productVolume.label', default: 'ProductVolume'), id])
            redirect(action: "list")
            return
        }

        [productVolumeInstance: productVolumeInstance]
    }

    def update(Long id, Long version) {
        def productVolumeInstance = ProductVolume.get(id)
        if (!productVolumeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productVolume.label', default: 'ProductVolume'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (productVolumeInstance.version > version) {
                productVolumeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'productVolume.label', default: 'ProductVolume')] as Object[],
                          "Another user has updated this ProductVolume while you were editing")
                render(view: "edit", model: [productVolumeInstance: productVolumeInstance])
                return
            }
        }

        productVolumeInstance.properties = params

        if (!productVolumeInstance.save(flush: true)) {
            render(view: "edit", model: [productVolumeInstance: productVolumeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'productVolume.label', default: 'ProductVolume'), productVolumeInstance.id])
        redirect(action: "show", id: productVolumeInstance.id)
    }

    def delete(Long id) {
        def productVolumeInstance = ProductVolume.get(id)
        if (!productVolumeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productVolume.label', default: 'ProductVolume'), id])
            redirect(action: "list")
            return
        }

        try {
            productVolumeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'productVolume.label', default: 'ProductVolume'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'productVolume.label', default: 'ProductVolume'), id])
            redirect(action: "show", id: id)
        }
    }
}
