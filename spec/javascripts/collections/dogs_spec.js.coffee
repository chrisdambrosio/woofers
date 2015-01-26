describe 'dogs collection', ->
  beforeEach ->
    @server = sinon.fakeServer.create()
    @dogs = new Woofers.Collections.DogsCollection()
  afterEach ->
    @server.restore()

  it 'should make the correct request', ->
    @dogs.fetch()
    expect(@server.requests.length).toEqual(1)
