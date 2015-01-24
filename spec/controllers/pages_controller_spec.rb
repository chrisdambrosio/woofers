require 'rails_helper'

describe PagesController, type: :controller do
  describe 'GET #main' do
    it 'responds successfully with an HTTP 200 status code' do
      get :main
      expect(response).to be_success
    end

    it 'renders the index template' do
      get :main
      expect(response).to render_template('main')
    end
  end
end
