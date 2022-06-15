class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :api_key
  validates :api_key, uniqueness: true
  has_secure_password
end