require 'rails_helper'

describe DogsController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      body = %`{"status":"ok","messages":{"generalMessages":[],"recordMessages":[]},"foundRows":876,"data":{"1027693":{"animalID":"1027693","animalOrgID":"1034","animalName":"Karma","animalBreed":"Chocolate Labrador Retriever \/ American Staffordshire Terrier \/ Mixed (short coat)","animalLocation":"92172"}}}`
      stub_request(:post, 'https://api.rescuegroups.org/http/json').
        with(headers: { 'Content-Type' => 'application/json' }).
        to_return(status: 200, body: body)

      get :index
      expect(response).to be_success
    end
  end
end
