describe Dog do
  it 'searches for dogs' do
      body = %`{"status":"ok","messages":{"generalMessages":[],"recordMessages":[]},"foundRows":876,"data":{"1027693":{"animalID":"1027693","animalOrgID":"1034","animalName":"Karma","animalBreed":"Chocolate Labrador Retriever \/ American Staffordshire Terrier \/ Mixed (short coat)","animalLocation":"92172"}}}`
      stub_request(:post, 'https://api.rescuegroups.org/http/json').
        with(headers: { 'Content-Type' => 'application/json' }).
        to_return(status: 200, body: body)

    dog_search = Dog.search
    expect(dog_search['dogs']).to_not be_empty
  end
end
