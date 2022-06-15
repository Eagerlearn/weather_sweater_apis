class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :api_key
  validates :api_key, uniqueness: true
  has_secure_password

  # def self.create_api_key
  #   SecureRandom.hex(13)
  # end

  # before_save do
  #   User.create_api_key
  # end
end