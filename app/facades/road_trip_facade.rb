class RoadTripFacade
  def self.get_roadtrip_details(origin, destination)

    trip_route = MapquestGeoService.get_trip_directions(origin, destination)
    city_weather = ForecastService.get_city_forecast(origin)
    coordinates = MapquestGeoService.get_coordinates(destination)
    duration = MapquestGeoFacade.calculate_travel_time(origin, destination)
    unless duration == "Impossible Route"
      weather = ForecastFacade.weather_at_arrival(destination, duration)
    end
    RoadTrip.new(origin, destination, weather)
  end
end

