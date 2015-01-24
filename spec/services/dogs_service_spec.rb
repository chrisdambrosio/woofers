require 'rails_helper'

describe DogsService do
  describe '#search response' do
    before do
      body = %`{"status":"ok","messages":{"generalMessages":[],"recordMessages":[]},"foundRows":876,"data":{"1027693":{"animalID":"1027693","animalOrgID":"1034","animalName":"Karma","animalBreed":"Chocolate Labrador Retriever \/ American Staffordshire Terrier \/ Mixed (short coat)","animalLocation":"92172"}}}`
      stub_request(:post, 'https://api.rescuegroups.org/http/json').
        with(headers: { 'Content-Type' => 'application/json' }).
        to_return(status: 200, body: body)
    end

    let(:dogs_service) { DogsService.new }
    let(:response) { dogs_service.search }

    it 'posts to api.rescuegroups.org' do
      dogs_service.search
      expect(a_request(:post, 'https://api.rescuegroups.org/http/json')).
        to have_been_made
    end

    it 'has dogs' do
      expect(response['dogs']).to_not be_empty
    end
  end
end
