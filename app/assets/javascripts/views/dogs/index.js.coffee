class Woofers.Views.DogsIndexView extends Backbone.View
  initialize: (options) ->
    @collection.on('add', this.addOne)
    @collection.on('reset', this.render)
    @render()

  template: JST['dogs/index']

  events:
    'click .show-more': 'fetchMore'

  addOne: (dog) =>
    dogView = new Woofers.Views.DogsCardView(model: dog)
    @$el.find('.cards').append(dogView.render().el)

  addAll: ->
    @collection.forEach(@addOne)

  render: =>
    @$el.html @template()
    @$el.find('.cards').empty()
    @addAll()
    this

  fetchMore: ->
    @collection.fetch(remove: false, data: {offset: @collection.length, limit: 20})
