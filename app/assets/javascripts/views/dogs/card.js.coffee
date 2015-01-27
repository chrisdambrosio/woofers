class Woofers.Views.DogsCardView extends Backbone.View
  template: JST['dogs/card']

  className: 'card-view'

  render: ->
    html = @template(@model.attributes)
    @$el.html(html)

    photos = @model.get('photos')
    mediumPhotoUrl = photos[0]?.medium
    @$el.find('.preview-photo')
      .css('background', "url(#{mediumPhotoUrl})")

    this
