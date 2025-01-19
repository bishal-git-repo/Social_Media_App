# spec/requests/posts_spec.rb
require_relative '../../app/helpers/jwt_helper'  # Correct path to load jwt_helper

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create(email: 'user@example.com', password: 'password123') }
  let(:token) { JwtHelper.encode(user_id: user.id) }

  describe 'POST /posts' do
    it 'creates a new post with valid data' do
      post '/posts', 
        headers: { 'Authorization' => "Bearer #{token}" }, 
        params: { post: { content: 'Test Post' } }

      expect(response).to have_http_status(:created)  # Expect status 201 (Created)
      expect(json['content']).to eq('Test Post')  # Check if the content is returned
    end
  end
end
