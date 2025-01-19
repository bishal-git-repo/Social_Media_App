class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :name, presence: true # Add this line to ensure 'name' is required

    has_many :posts, dependent: :destroy
  end
  