require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      get users_path
      expect(response.body).to render_template(:index)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get '/users/1'
      expect(response.body).to render_template(:show)
      expect(response).to have_http_status(:success)
    end
  end
end
