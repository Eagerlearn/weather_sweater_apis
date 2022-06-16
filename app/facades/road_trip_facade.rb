class RoadTripFacade
  def self.get_roadtrip_details(origin, destination)
    trip_route = MapquestGeoService.get_trip_directions(origin, destination)
  end
end