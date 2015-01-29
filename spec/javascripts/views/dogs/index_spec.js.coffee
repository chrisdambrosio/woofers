#= require fixtures/dogs

describe 'Woofers.Views.DogsIndexView', ->
  describe '#addOne', ->
    it 'renders a model', ->
      dog = new Woofers.Models.Dog @fixtures.dogs['bit']
      dogs = new Woofers.Collections.DogsCollection([])
      view = new Woofers.Views.DogsIndexView(collection: dogs)
      view.addOne(dog)

      expect(view.$el).toContainText('Bit')

  describe 'rendering the collection', ->
    beforeEach ->
      @dogs = new Woofers.Collections.DogsCollection \
        [ @fixtures.dogs['bit'] ]
      @view = new Woofers.Views.DogsIndexView(collection: @dogs)

    describe '#addAll', ->
      it 'renders the collection', ->
        @view.addAll()
        expect(@view.$el).toContainText('Bit')

    describe '#render', ->
      it 'renders the collection', ->
        @view.render()
        expect(@view.$el).toContainText('Bit')

      it 'returns the view', ->
        expect(@view.render()).toBe(@view)

    describe 'adding new model to the collection', ->
      it 'renders the new model', ->
        @dogs.add([
          @fixtures.dogs['byte']
        ])
        expect(@view.$el).toContainText('Byte')

    describe 'handling the collection reset', ->
      it 'renders the empty collection', ->
        @dogs.reset()
        expect(@view.$el.find('.cards')).toBeEmpty()
