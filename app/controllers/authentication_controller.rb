class AuthenticationController < ApplicationController
    def login
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        token = JWT.encode({ user_id: user.id }, Rails.application.secret_key_base)
        render json: { token: token }, status: :ok
      else
        render json: { error: 'Invalid username or password' }, status: :unauthorized
      end
    end
  
    def logout
      # Since JWT is stateless, there's no server-side session to destroy.
      # To "logout," the client should discard the token.
      render json: { message: 'Logged out successfully' }, status: :ok
    end
  end
  