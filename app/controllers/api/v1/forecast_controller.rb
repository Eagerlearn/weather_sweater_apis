class Api::V1::ForecastController < ApplicationController
  def index
    @city_forecast = ForecastFacade.get_forecast_details(params[:location])
  end
end