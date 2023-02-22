require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  xdescribe 'GET /index' do
    it 'returns http success' do
      get '/posts/index'
      expect(response).to have_http_status(:success)
    end
  end

  xdescribe 'GET /new' do
    it 'returns http success' do
      get '/posts/new'
      expect(response).to have_http_status(:success)
    end
  end

  xdescribe 'GET /edit' do
    it 'returns http success' do
      get '/posts/edit'
      expect(response).to have_http_status(:success)
    end
  end

  xdescribe 'GET /show' do
    it 'returns http success' do
      get '/posts/show'
      expect(response).to have_http_status(:success)
    end
  end
end
