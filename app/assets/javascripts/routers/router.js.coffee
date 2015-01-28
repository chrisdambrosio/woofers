class Woofers.Routers.Router extends Backbone.Router
  routes:
    '': 'index'
    ':id': 'show'

  index: ->
    @dogs = new Woofers.Collections.DogsCollection()
    @dogsIndexView = new Woofers.Views.DogsIndexView
      collection: @dogs
    window.myView = @dogsIndexView
    $('#app').html(@dogsIndexView.render().el)
    @dogs.fetch()
  show: (id) ->
