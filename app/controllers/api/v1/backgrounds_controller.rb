class Api::V1::BackgroundsController < ApplicationController
  def show
    @city_background = BackgroundsFacade.get_background(params[:location])
    require "pry"; binding.pry
  end
end