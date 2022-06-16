class MapquestGeoFacade
  def self.calculate_travel_time(origin, destination)
    travel_time = MapquestGeoService.get_trip_directions(origin, destination)

    if travel_time[:info][:statuscode] == 402
      'Impossible Route'
    else
      {
        formatted_time: travel_time[:route][:formattedTime],
        real_time: travel_time[:route][:realTime]
      }
    end
    # require "pry"; binding.pry
  end
end