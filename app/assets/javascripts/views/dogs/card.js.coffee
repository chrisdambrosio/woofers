class Woofers.Views.DogsCardView extends Backbone.View
  template: JST['dogs/card']

  className: 'card-view'

  render: ->
    html = @template(@model.attributes)
    @$el.html(html)
    this
