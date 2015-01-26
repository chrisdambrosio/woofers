class Woofers.Views.DogsCardView extends Backbone.View
  template: JST['dogs/card']

  className: 'card-view'

  render: ->
    html = @template(@model.attributes)

    photos = @model.get('photos')
    largeImageUrl = photos[0]?.large.url
    @$el.css('background', "url(#{largeImageUrl})")

    @$el.html(html)
    this
