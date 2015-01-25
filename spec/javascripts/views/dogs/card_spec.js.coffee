describe 'Woofers.Views.DogsCardView', ->
  describe '#render', ->
    beforeEach ->
      model = new Woofers.Models.Dog(id: 1, name: 'Bit')
      @view = new Woofers.Views.DogsCardView(model: model)

    it 'renders the model', ->
      expect(@view.render().$el).toContainText('Bit')

    it 'returns the view', ->
      expect(@view.render()).toBe(@view)
