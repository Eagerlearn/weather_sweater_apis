class ForecastFacade
  def self.get_forecast_details(city)
    city_weather = CityService.get_city_forecast(city)
    Forecast.new(city_weather)
  end
end