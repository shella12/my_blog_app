require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      get '/posts'
      expect(response.body).to render_template(:index)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get '/users/1/posts/7'
      expect(response.body).to render_template(:show)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #index' do
    it 'returns http success' do
      get '/users/1/posts'
      expect(response.body).to render_template(:index)
      expect(response).to have_http_status(:success)
    end
  end
end
