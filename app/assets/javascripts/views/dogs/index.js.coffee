class Woofers.Views.DogsIndexView extends Backbone.View
  initialize: (options) ->
    @collection.on('add', this.addOne)
    @collection.on('reset', this.render)
    @render()

  template: 'dogs/index'

  addOne: (dog) =>
    dogView = new Woofers.Views.DogsCardView(model: dog)
    @$el.append(dogView.render().el)

  addAll: ->
    @collection.forEach(@addOne)

  render: =>
    @$el.empty()
    @addAll()
    this
