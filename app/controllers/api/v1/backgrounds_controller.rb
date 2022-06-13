class Api::V1::BackgroundsController < ApplicationController
  def show
    city_background = BackgroundsFacade.get_background(params[:location])

    render json: BackgroundSerializer.display_photo(city_background)
  end
end