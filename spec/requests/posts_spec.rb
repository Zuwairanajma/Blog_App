require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/732/posts' do
    it 'returns a 200 OK status' do
      get '/users/732/posts'
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get '/users/732/posts'
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/732/posts/:id' do
    it 'renders the show template' do
      get '/users/732/posts/2'
      expect(response).to render_template(:show)
    end

    it 'contains the post ID in the URL' do
      get '/users/732/posts/2'
      expect(request.fullpath).to include('/users/732/posts/2')
    end

    it 'renders the page with html template' do
      get '/users/732/posts'
      expect(response.body).to include('<div class="container">')
      expect(response.body).to include('<h1>Username</h1>')
      expect(response.body).to include('<p class= "inner-text">Number of posts x</p>')
      expect(response.body).to include('<div class="container">')
      expected_image_path = "src=\"#{ActionController::Base.helpers.image_path('example.com.png')}\" alt=\"image\">"
      expect(response.body).to include(expected_image_path)
      expect(response.body).to include('<h2>post 1</h2>')
      expect(response.body).to include('<h2>post 2</h2>')
      expect(response.body).to include('<p>comment 1</p>')
      expect(response.body).to include('<p>comment 2</p>')
      expect(response.body).to include('<p>comment 3</p>')
    end
  end
end
