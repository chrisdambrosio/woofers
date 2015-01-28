class Woofers.Views.DogsCardView extends Backbone.View
  template: JST['dogs/card']

  className: 'card-view'

  events:
    'click .preview-photo': 'show'

  render: ->
    html = @template(@model.attributes)
    @$el.html(html)

    photos = @model.get('photos')
    mediumPhotoUrl = photos[0]?.medium
    @$el.find('.preview-photo')
      .css('background', "url(#{mediumPhotoUrl})")

    this

  show: (e) ->
    e.preventDefault()

    id = @model.get('id')
    Woofers.router.navigate("dogs/#{id}", trigger: true)

    false
