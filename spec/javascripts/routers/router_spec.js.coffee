#= require fixtures/dogs

describe 'Router', ->
  beforeEach ->
    @collection = new Woofers.Collections.DogsCollection \
      [ @fixtures.dogs['bit'] ]
    @fetchStub = sinon.stub(@collection, 'fetch').returns(null)
    @dogsIndexViewStub = sinon.stub(window.Woofers.Views, 'DogsIndexView')
      .returns(new Backbone.View())
    @dogsCollectionStub = sinon.stub(window.Woofers.Collections, 'DogsCollection')
      .returns(@collection)

    @router = new Woofers.Routers.Router()
    @routeSpy = sinon.spy()

    try
      Backbone.history.start(silent: true, pushState: true)
    catch
      # history already started

    @router.navigate("elsewhere")

  afterEach ->
    window.Woofers.Collections.DogsCollection.restore()
    window.Woofers.Views.DogsIndexView.restore()


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
    it 'fires the show route with an id', ->
      @router.on('route:show', @routeSpy)
      @router.navigate('815', true)
      expect(@routeSpy.calledOnce).toBeTruthy()
      expect(@routeSpy.calledWith('815')).toBeTruthy()

    it 'creates a show view'
    it 'adds the model to the show view'
