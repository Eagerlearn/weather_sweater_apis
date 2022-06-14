class Api::V1::BreweriesController < ApplicationController
  def index
    list_of_breweries = BreweriesFacade.get_breweries_list(params[:location], params[:quantity])
    city_forecast = ForecastFacade.get_forecast_details(params[:location])
    render json: BreweriesSerializer.breweries_list_by_city(list_of_breweries, city_forecast)
  end
end