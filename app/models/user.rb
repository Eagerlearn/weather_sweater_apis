class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates :api_key, uniqueness: true
  has_secure_password
  has_secure_token :api_key
end