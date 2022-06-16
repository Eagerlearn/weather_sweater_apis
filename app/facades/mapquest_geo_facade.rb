class MapquestGeoFacade
  def self.calculate_travel_time(origin, destination)
    travel_time = MapquestGeoService.get_trip_directions(origin, destination)

    x = if directions[:info][:statuscode] == 402
      'Impossible Route'
    else
      {
        formatted_time: directions[:route][:formattedTime],
        real_time: directions[:route][:realTime]
      }
    end
    require "pry"; binding.pry
  end
end