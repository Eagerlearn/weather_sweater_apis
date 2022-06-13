class Api::V1::ForecastController < ApplicationController
  def index
    city_forecast = ForecastFacade.get_forecast_details(params[:location])

    render json: ForecastSerializer.forecast_list(city_forecast[0], city_forecast[1], city_forecast[2])
  end
end