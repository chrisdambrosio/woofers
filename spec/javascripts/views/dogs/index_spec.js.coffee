describe 'Woofers.Views.DogsIndexView', ->
  describe '#addOne', ->
    it 'renders a model', ->
      dog = new Woofers.Models.Dog(id: 1, name: 'Proxy')
      view = new Woofers.Views.DogsIndexView()
      view.addOne(dog)

      expect(view.$el).toContainText('Proxy')

  describe 'rendering the collection', ->
    beforeEach ->
      @dogs = new Woofers.Collections.DogsCollection([
        { id: 1, name: 'Bit' }
        { id: 2, name: 'Byte' }
      ])
      @view = new Woofers.Views.DogsIndexView(collection: @dogs)

    describe '#addAll', ->
      it 'renders the collection', ->
        @view.addAll()
        expect(@view.$el).toContainText('Bit')
        expect(@view.$el).toContainText('Byte')

    describe '#render', ->
      it 'renders the collection', ->
        @view.render()
        expect(@view.$el).toContainText('Bit')
        expect(@view.$el).toContainText('Byte')

      it 'returns the view', ->
        expect(@view.render()).toBe(@view)
