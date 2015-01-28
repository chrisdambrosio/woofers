require 'rails_helper'

describe 'routing to the dogs api route', type: :routing do
  it 'routes /api/dogs to dogs#index' do
    expect(get: '/api/dogs').to route_to \
      controller: 'api/dogs',
      action: 'index'
  end
end
