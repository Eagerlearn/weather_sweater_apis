class Api::V1::UsersController < ApplicationController
  def registration
    registered_user = User.new
  end
end