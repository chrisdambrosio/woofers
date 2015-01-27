class Woofers.Views.DogsCardView extends Backbone.View
  template: JST['dogs/card']

  className: 'card-view'

  render: ->
    html = @template(@model.attributes)
    @$el.html(html)

    photos = @model.get('photos')
    largeImageUrl = photos[0]?.large.url
    @$el.find('.preview-photo')
      .css('background', "url(#{largeImageUrl})")

    this
