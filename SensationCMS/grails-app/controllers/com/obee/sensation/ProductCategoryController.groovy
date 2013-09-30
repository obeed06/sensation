package com.obee.sensation

import org.springframework.dao.DataIntegrityViolationException

class ProductCategoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [productCategoryInstanceList: ProductCategory.list(params), productCategoryInstanceTotal: ProductCategory.count()]
    }

    def create() {
        [productCategoryInstance: new ProductCategory(params)]
    }

    def save() {
        def productCategoryInstance = new ProductCategory(params)
        if (!productCategoryInstance.save(flush: true)) {
            render(view: "create", model: [productCategoryInstance: productCategoryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), productCategoryInstance.id])
        redirect(action: "show", id: productCategoryInstance.id)
    }

    def show(Long id) {
        def productCategoryInstance = ProductCategory.get(id)
        if (!productCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), id])
            redirect(action: "list")
            return
        }

        [productCategoryInstance: productCategoryInstance]
    }

    def edit(Long id) {
        def productCategoryInstance = ProductCategory.get(id)
        if (!productCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), id])
            redirect(action: "list")
            return
        }

        [productCategoryInstance: productCategoryInstance]
    }

    def update(Long id, Long version) {
        def productCategoryInstance = ProductCategory.get(id)
        if (!productCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (productCategoryInstance.version > version) {
                productCategoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'productCategory.label', default: 'ProductCategory')] as Object[],
                          "Another user has updated this ProductCategory while you were editing")
                render(view: "edit", model: [productCategoryInstance: productCategoryInstance])
                return
            }
        }

        productCategoryInstance.properties = params

        if (!productCategoryInstance.save(flush: true)) {
            render(view: "edit", model: [productCategoryInstance: productCategoryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), productCategoryInstance.id])
        redirect(action: "show", id: productCategoryInstance.id)
    }

    def delete(Long id) {
        def productCategoryInstance = ProductCategory.get(id)
        if (!productCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), id])
            redirect(action: "list")
            return
        }

        try {
            productCategoryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), id])
            redirect(action: "show", id: id)
        }
    }
}
