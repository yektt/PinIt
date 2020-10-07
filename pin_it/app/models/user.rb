class User < ApplicationRecord
  validates :email, presence: true
  
  has_many :comments
  has_many :pin
end
