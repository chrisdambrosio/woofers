class Woofers.Routers.Router extends Backbone.Router
  initialize: ->
    @dogs = new Woofers.Collections.DogsCollection()

  routes:
    '': 'index'
    'dogs/:id': 'show'

  index: ->
    @dogsIndexView = new Woofers.Views.DogsIndexView
      collection: @dogs
    $('#app').html(@dogsIndexView.render().el)

    @dogsIndexView.fetchMore() if @dogsIndexView.collection.length is 0

  show: (id) ->
    model = @dogs.get(id)
    @dogsShowView = new Woofers.Views.DogsShowView model: model
    $('#app').html(@dogsShowView.render().el)
