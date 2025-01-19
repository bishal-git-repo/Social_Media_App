# spec/requests/authentication_spec.rb
require_relative '../../app/helpers/jwt_helper'  # Correct path to load jwt_helper

RSpec.describe "Authentication", type: :request do
  describe "POST /login" do
    let(:user) { User.create(email: 'user@example.com', password: 'password123') }

    it "logs in with correct credentials" do
      post '/login', params: { email: user.email, password: user.password }
      expect(response).to have_http_status(:ok)  # Expect status 200
      expect(json['email']).to eq(user.email)
    end
  end
end
