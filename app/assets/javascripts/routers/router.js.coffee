class Woofers.Routers.Router extends Backbone.Router
  routes:
    '': 'index'

  index: ->
    @dogs = new Woofers.Collections.DogsCollection()
    @dogsIndexView = new Woofers.Views.DogsIndexView
      collection: @dogs
    window.myView = @dogsIndexView
    $('#app').html(@dogsIndexView.render().el)
    @dogs.fetch()
