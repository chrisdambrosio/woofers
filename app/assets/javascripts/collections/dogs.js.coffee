class Woofers.Collections.DogsCollection extends Backbone.Collection
  url: '/api/dogs'
  model: Woofers.Models.Dog
  parse: (response) ->
    response.dogs
