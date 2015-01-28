require 'rails_helper'

describe API::DogsController, type: :controller do
  before do
    API::DogsController.class_variable_set(:@@dogs_service, FakeDogsService)
  end

  after do
    API::DogsController.class_variable_set(:@@dogs_service, DogsService)
  end

  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
    end
  end
end

class FakeDogsService
  def search(options = {})
    [{ name: 'Bit' }]
  end
end
