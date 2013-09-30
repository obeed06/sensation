package com.obee.sensation



import org.junit.*
import grails.test.mixin.*

@TestFor(CocktailComboController)
@Mock(CocktailCombo)
class CocktailComboControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cocktailCombo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cocktailComboInstanceList.size() == 0
        assert model.cocktailComboInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cocktailComboInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cocktailComboInstance != null
        assert view == '/cocktailCombo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cocktailCombo/show/1'
        assert controller.flash.message != null
        assert CocktailCombo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cocktailCombo/list'

        populateValidParams(params)
        def cocktailCombo = new CocktailCombo(params)

        assert cocktailCombo.save() != null

        params.id = cocktailCombo.id

        def model = controller.show()

        assert model.cocktailComboInstance == cocktailCombo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cocktailCombo/list'

        populateValidParams(params)
        def cocktailCombo = new CocktailCombo(params)

        assert cocktailCombo.save() != null

        params.id = cocktailCombo.id

        def model = controller.edit()

        assert model.cocktailComboInstance == cocktailCombo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cocktailCombo/list'

        response.reset()

        populateValidParams(params)
        def cocktailCombo = new CocktailCombo(params)

        assert cocktailCombo.save() != null

        // test invalid parameters in update
        params.id = cocktailCombo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cocktailCombo/edit"
        assert model.cocktailComboInstance != null

        cocktailCombo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cocktailCombo/show/$cocktailCombo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cocktailCombo.clearErrors()

        populateValidParams(params)
        params.id = cocktailCombo.id
        params.version = -1
        controller.update()

        assert view == "/cocktailCombo/edit"
        assert model.cocktailComboInstance != null
        assert model.cocktailComboInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cocktailCombo/list'

        response.reset()

        populateValidParams(params)
        def cocktailCombo = new CocktailCombo(params)

        assert cocktailCombo.save() != null
        assert CocktailCombo.count() == 1

        params.id = cocktailCombo.id

        controller.delete()

        assert CocktailCombo.count() == 0
        assert CocktailCombo.get(cocktailCombo.id) == null
        assert response.redirectedUrl == '/cocktailCombo/list'
    }
}
