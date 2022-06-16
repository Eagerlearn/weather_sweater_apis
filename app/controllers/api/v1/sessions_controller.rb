class Api::V1::SessionsController < ApplicationController
  def login
    # key = {api_key: SecureRandom.hex(13)}
    user = User.find_by(email: params[:email])
    user.present?
    render json: SessionsSerializer.logged_in_user(user), status: 200
  end

  private
  def user_params
    params.permit(:email, :password, :api_key)
  end
end
