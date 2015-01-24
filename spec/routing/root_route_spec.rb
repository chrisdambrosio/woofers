require 'rails_helper'

describe 'routing to root route', type: :routing do
  it 'routes / to pages#main' do
    expect(get: '/').to route_to \
      controller: 'pages',
      action: 'main'
  end
end
