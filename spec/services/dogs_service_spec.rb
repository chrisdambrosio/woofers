require 'rails_helper'

describe DogsService do
  it 'posts to api.rescuegroups.org' do
    stub_request(:post, 'https://api.rescuegroups.org/http/json').
      with(headers: { 'Content-Type' => 'application/json' }).
      to_return(status: 200)

    DogsService.new.fetch

    expect(a_request(:post, 'https://api.rescuegroups.org/http/json')).
      to have_been_made
  end
end
