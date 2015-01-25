class Woofers.Views.DogsCardView extends Backbone.View
  template: JST['dogs/card']

  render: ->
    html = @template(@model.attributes)
    @$el.html(html)
    this
