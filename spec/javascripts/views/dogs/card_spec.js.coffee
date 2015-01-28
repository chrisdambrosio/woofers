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

    describe 'click through to show view', ->
      beforeEach ->
        @routerSpy = sinon.spy(Woofers.router, 'navigate')
        @view.render().$el.find('.preview-photo').trigger('click')
      afterEach ->
        Woofers.router.navigate.restore()

      it 'should navigate to the show route', ->
        expect(@routerSpy.calledOnce).toBeTruthy()
        expect(@routerSpy.calledWith('dogs/815', trigger: true)).toBeTruthy()
