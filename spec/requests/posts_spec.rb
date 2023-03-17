require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/posts'
      expect(response).to have_http_status(:success)
    end
  end
  
  describe 'GET users/:id/post/:id' do
    it 'returns http success' do
      get '/users/1/posts/7'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET users/:id/post' do
    it 'returns http success' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
    end
  end
end