describe 'Router', ->
  beforeEach ->
    @collection = new Backbone.Collection()
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

  it 'fires the index route with a blank hash', ->
    @router.on('route:index', @routeSpy)
    @router.navigate('', true)
    expect(@routeSpy.calledOnce).toBeTruthy()

  describe 'the index route', ->
    beforeEach ->
      @router.index()

    it 'creates a dogs collection', ->
      expect(@dogsCollectionStub.calledOnce).toBeTruthy()
      expect(@dogsCollectionStub.calledWithExactly()).toBeTruthy()

    it 'creates a dogs index view', ->
      expect(@dogsIndexViewStub.calledOnce).toBeTruthy()
      expect(@dogsIndexViewStub.calledWith(collection: @collection))
        .toBeTruthy()
