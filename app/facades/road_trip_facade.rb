class RoadTripFacade
  def self.get_roadtrip_details(origin, destination)
    trip_route = MapquestGeoService.get_trip_directions(origin, destination)
    city_weather = ForecastService.get_city_forecast(origin)
    coordinates = MapquestGeoService.get_coordinates(destination)
  end

  def new_road_trip(origin, destination)
    weather_at_arrival = ForecastFacade.weather_at_arrival(destination, travel_time)

  end
end

# lat = coordinates[:results][0][:locations][0][:latLng][:lat]
# lon = coordinates[:results][0][:locations][0][:latLng][:lng]


