package com.obee.sensation



import org.junit.*
import grails.test.mixin.*

@TestFor(CocktailController)
@Mock(Cocktail)
class CocktailControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cocktail/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cocktailInstanceList.size() == 0
        assert model.cocktailInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cocktailInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cocktailInstance != null
        assert view == '/cocktail/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cocktail/show/1'
        assert controller.flash.message != null
        assert Cocktail.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cocktail/list'

        populateValidParams(params)
        def cocktail = new Cocktail(params)

        assert cocktail.save() != null

        params.id = cocktail.id

        def model = controller.show()

        assert model.cocktailInstance == cocktail
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cocktail/list'

        populateValidParams(params)
        def cocktail = new Cocktail(params)

        assert cocktail.save() != null

        params.id = cocktail.id

        def model = controller.edit()

        assert model.cocktailInstance == cocktail
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cocktail/list'

        response.reset()

        populateValidParams(params)
        def cocktail = new Cocktail(params)

        assert cocktail.save() != null

        // test invalid parameters in update
        params.id = cocktail.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cocktail/edit"
        assert model.cocktailInstance != null

        cocktail.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cocktail/show/$cocktail.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cocktail.clearErrors()

        populateValidParams(params)
        params.id = cocktail.id
        params.version = -1
        controller.update()

        assert view == "/cocktail/edit"
        assert model.cocktailInstance != null
        assert model.cocktailInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cocktail/list'

        response.reset()

        populateValidParams(params)
        def cocktail = new Cocktail(params)

        assert cocktail.save() != null
        assert Cocktail.count() == 1

        params.id = cocktail.id

        controller.delete()

        assert Cocktail.count() == 0
        assert Cocktail.get(cocktail.id) == null
        assert response.redirectedUrl == '/cocktail/list'
    }
}
