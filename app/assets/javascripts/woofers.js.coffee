window.Woofers =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    @router = new Woofers.Routers.Router()
    Backbone.history.start(pushState: true)

$(document).ready ->
  Woofers.initialize()
