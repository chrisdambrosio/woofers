class Woofers.Views.DogsIndexView extends Backbone.View
  template: 'dogs/index'

  addOne: (dog) =>
    dogView = new Woofers.Views.DogsCardView(model: dog)
    @$el.append(dogView.render().el)

  addAll: ->
    @collection.forEach(@addOne)

  render: ->
    @addAll()
    this
