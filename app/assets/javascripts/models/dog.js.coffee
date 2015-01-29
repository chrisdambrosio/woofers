class Woofers.Models.Dog extends Backbone.Model
  initialize: ->
    @on 'change', @expandAttributes
    @expandAttributes()

  expandAttributes: ->
    @expandSex()
    @expandSize()

  expandSize: ->
    switch @get('size')
      when 'S' then @set('size', 'Small')
      when 'M' then @set('size', 'Medium')
      when 'L' then @set('size', 'Large')

  expandSex: ->
    switch @get('sex')
      when 'M' then @set('sex', 'Male')
      when 'F' then @set('sex', 'Female')
      when 'U' then @set('sex', 'Unknown')
