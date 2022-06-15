class Api::V1::UsersController < ApplicationController
  def registration
    key = {api_key: SecureRandom.hex(13)}
    registered_user = User.create!(user_params.merge(key))

    render json: UsersSerializer.serialized_user(registered_user), status: 201
  end

  private
  def user_params
    params.permit(:email, :password, :api_key, :password_confirmation)
  end
end