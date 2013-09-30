package com.obee.sensation



import org.junit.*
import grails.test.mixin.*

@TestFor(ProductVolumeController)
@Mock(ProductVolume)
class ProductVolumeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/productVolume/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.productVolumeInstanceList.size() == 0
        assert model.productVolumeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.productVolumeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.productVolumeInstance != null
        assert view == '/productVolume/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/productVolume/show/1'
        assert controller.flash.message != null
        assert ProductVolume.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/productVolume/list'

        populateValidParams(params)
        def productVolume = new ProductVolume(params)

        assert productVolume.save() != null

        params.id = productVolume.id

        def model = controller.show()

        assert model.productVolumeInstance == productVolume
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/productVolume/list'

        populateValidParams(params)
        def productVolume = new ProductVolume(params)

        assert productVolume.save() != null

        params.id = productVolume.id

        def model = controller.edit()

        assert model.productVolumeInstance == productVolume
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/productVolume/list'

        response.reset()

        populateValidParams(params)
        def productVolume = new ProductVolume(params)

        assert productVolume.save() != null

        // test invalid parameters in update
        params.id = productVolume.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/productVolume/edit"
        assert model.productVolumeInstance != null

        productVolume.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/productVolume/show/$productVolume.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        productVolume.clearErrors()

        populateValidParams(params)
        params.id = productVolume.id
        params.version = -1
        controller.update()

        assert view == "/productVolume/edit"
        assert model.productVolumeInstance != null
        assert model.productVolumeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/productVolume/list'

        response.reset()

        populateValidParams(params)
        def productVolume = new ProductVolume(params)

        assert productVolume.save() != null
        assert ProductVolume.count() == 1

        params.id = productVolume.id

        controller.delete()

        assert ProductVolume.count() == 0
        assert ProductVolume.get(productVolume.id) == null
        assert response.redirectedUrl == '/productVolume/list'
    }
}
