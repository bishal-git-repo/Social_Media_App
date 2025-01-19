# app/helpers/jwt_helper.rb
class JwtHelper
  def self.encode(payload)
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end

  def self.decode(token)
    decoded = JWT.decode(token, Rails.application.credentials.secret_key_base)[0]
    HashWithIndifferentAccess.new(decoded) # returns the decoded payload as a hash
  rescue JWT::DecodeError => e
    nil
  end
end
