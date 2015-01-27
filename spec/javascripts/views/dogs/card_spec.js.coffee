#= require fixtures/dogs

describe 'Woofers.Views.DogsCardView', ->
  describe '#render', ->
    beforeEach ->
      model = new Woofers.Models.Dog @fixtures.dogs['bit']
      @view = new Woofers.Views.DogsCardView(model: model)

    it 'renders the model', ->
      expect(@view.render().$el).toContainText('Bit')

    it 'returns the view', ->
      expect(@view.render()).toBe(@view)
