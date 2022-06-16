class ForecastFacade
  def self.get_forecast_details(city)
    city_weather = ForecastService.get_city_forecast(city)

    current = CurrentForecast.new(city_weather)

    daily = city_weather[:daily][0..4].map do |day_forecast|
      DailyForecast.new(day_forecast)
    end
    hourly = city_weather[:hourly][0..7].map do |hourly_forecast|
      HourlyForecast.new(hourly_forecast)
    end
    [current, daily, hourly]
  end

  def self.weather_at_arrival(destination, travel_time)
    forecast = ForecastService.get_city_forecast(destination)
    forecast[:hourly].find do |hour|
      hour[:dt] >= (Time.now.to_i + travel_time[:real_time])
    end
  end
end