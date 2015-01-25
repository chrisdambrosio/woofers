describe 'Woofers.Views.DogsIndexView', ->
  describe '#addOne', ->
    it 'renders a model', ->
      dog = new Woofers.Models.Dog(id: 1, name: 'Proxy')
      dogs = new Woofers.Collections.DogsCollection([])
      view = new Woofers.Views.DogsIndexView(collection: dogs)
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

    describe 'adding new model to the collection', ->
      it 'renders the new model', ->
        @dogs.add([
          { id: 3, name: 'Proxy' }
        ])
        expect(@view.$el).toContainText('Proxy')
        expect(@view.$el.children().length).toBe(3)

    describe 'handling the collection reset', ->
      it 'renders the empty collection', ->
        @dogs.reset()
        expect(@view.$el).toBeEmpty()
