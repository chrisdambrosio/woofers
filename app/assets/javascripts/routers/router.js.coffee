class Woofers.Routers.Router extends Backbone.Router
  initialize: ->
    @dogs = new Woofers.Collections.DogsCollection()
    @dogs.fetch()

  routes:
    '': 'index'
    ':id': 'show'

  index: ->
    @dogsIndexView = new Woofers.Views.DogsIndexView
      collection: @dogs
    $('#app').html(@dogsIndexView.render().el)

  show: (id) ->
    model = @dogs.get(id)
    @dogsShowView = new Woofers.Views.DogsShowView model: model
    $('#app').html(@dogsShowView.render().el)
