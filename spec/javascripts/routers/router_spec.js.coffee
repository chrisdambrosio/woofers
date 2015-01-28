#= require fixtures/dogs

describe 'Router', ->
  beforeEach ->
    @bit = @fixtures.dogs['bit']
    @collection = new Woofers.Collections.DogsCollection \
      [ @bit ]
    @fetchStub = sinon.stub(@collection, 'fetch').returns(null)
    @dogsIndexViewStub = sinon.stub(window.Woofers.Views, 'DogsIndexView')
      .returns(new Backbone.View())
    @dogsShowViewStub = sinon.stub(window.Woofers.Views, 'DogsShowView')
      .returns(new Backbone.View())
    @dogsCollectionStub = sinon.stub(window.Woofers.Collections, 'DogsCollection')
      .returns(@collection)
    @dogModelStub = sinon.stub(window.Woofers.Models, 'Dog')
      .returns(@bit)

    @router = new Woofers.Routers.Router()
    @routeSpy = sinon.spy()

    try
      Backbone.history.start(silent: true, pushState: true)
    catch
      # history already started

    @router.navigate("elsewhere")

  afterEach ->
    window.Woofers.Collections.DogsCollection.restore()
    window.Woofers.Models.Dog.restore()
    window.Woofers.Views.DogsIndexView.restore()
    window.Woofers.Views.DogsShowView.restore()

  describe 'the index route', ->
    beforeEach ->
      @router.index()

    it 'fires the index route with a blank hash', ->
      @router.on('route:index', @routeSpy)
      @router.navigate('', true)
      expect(@routeSpy.calledOnce).toBeTruthy()

    it 'creates a dogs collection', ->
      expect(@dogsCollectionStub.calledOnce).toBeTruthy()
      expect(@dogsCollectionStub.calledWithExactly()).toBeTruthy()

    it 'creates a dogs index view', ->
      expect(@dogsIndexViewStub.calledOnce).toBeTruthy()
      expect(@dogsIndexViewStub.calledWith(collection: @collection))
        .toBeTruthy()

    it 'fetches the dogs collection from the server', ->
      expect(@fetchStub.calledOnce).toBeTruthy()
      expect(@fetchStub.calledWith()).toBeTruthy()

  describe 'the show route', ->
    beforeEach ->
      @router.on('route:show', @routeSpy)
      @router.navigate('dogs/815', true)

    it 'fires the show route with an id', ->
      expect(@routeSpy.calledOnce).toBeTruthy()
      expect(@routeSpy.calledWith('815')).toBeTruthy()

    it 'creates a show view', ->
      expect(@dogsShowViewStub.calledOnce).toBeTruthy()
