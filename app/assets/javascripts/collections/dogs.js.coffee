class Woofers.Collections.DogsCollection extends Backbone.Collection
  url: '/api/dogs'
  parse: (response) ->
    response.dogs
