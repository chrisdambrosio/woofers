#= require helpers/valid_response
#= require fixtures/dogs

describe 'dogs collection', ->
  beforeEach ->
    @fixture = @fixtures.Dogs.valid
    @server = sinon.fakeServer.create()
    @server.respondWith(
      'GET'
      '/api/dogs'
      @validResponse(@fixture)
    )

    @dogs = new Woofers.Collections.DogsCollection()
  afterEach ->
    @server.restore()

  it 'should make the correct request', ->
    @dogs.fetch()
    expect(@server.requests.length).toEqual(1)

  it 'should parse dogs from the response', ->
    @dogs.fetch()
    @server.respond()
    expect(@dogs.at(0).get('name')).toEqual('Bit')

  it 'should use the Dog model', ->
    @dogs.fetch()
    @server.respond()
    expect(@dogs.at(0) instanceof Woofers.Models.Dog)
      .toBeTruthy()
