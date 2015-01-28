class Woofers.Views.DogsShowView extends Backbone.View
  template: JST['dogs/show']

  className: 'dogs-show-view'

  render: ->
    html = @template(@model.attributes)
    @$el.html(html)

    this
