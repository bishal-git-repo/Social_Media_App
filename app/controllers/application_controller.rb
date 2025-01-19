# class ApplicationController < ActionController::API
#     def authorize_request
#       header = request.headers['Authorization']
#       token = header.split(' ').last if header
#       decoded = JWT.decode(token, Rails.application.secret_key_base)[0]
#       @current_user = User.find(decoded['user_id'])
#     rescue ActiveRecord::RecordNotFound, JWT::DecodeError
#       render json: { error: 'Unauthorized' }, status: :unauthorized
#     end
#   end

class ApplicationController < ActionController::API
  def authorize_request
    header = request.headers['Authorization']
    if header.present? && header.split(' ').last
      token = header.split(' ').last
      decoded = JwtHelper.decode(token)
      @current_user = User.find(decoded[:user_id]) # Assuming the JWT contains the user_id
    else
      render json: { error: 'Not authorized' }, status: :unauthorized
    end
  rescue JWT::DecodeError => e
    render json: { error: 'Invalid token' }, status: :unauthorized
  end
end
