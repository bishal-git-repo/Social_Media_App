

class Post < ApplicationRecord
  # Add this line
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
end
