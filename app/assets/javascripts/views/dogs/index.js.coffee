class Woofers.Views.DogsIndexView extends Backbone.View
  initialize: (options) ->
    @collection.on('add', this.addOne)
    @collection.on('reset', this.render)
    @collection.on 'request', @showLoading
    @collection.on 'sync', @hideLoading
    @collection.on 'error', @hideLoading

    @render()

  template: JST['dogs/index']

  showLoading: =>
    @$el.find('.loading').show()
    @$el.find('.footer-actions').hide()

  hideLoading: =>
    @$el.find('.loading').hide()
    @$el.find('.footer-actions').show()

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
    @hideLoading()
    this

  fetchMore: ->
    @collection.fetch remove: false, \
      data: {offset: @collection.length, limit: 20}
