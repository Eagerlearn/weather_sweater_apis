class RoadTrip

  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(origin, destination, duration, weather)
      @start_city     = origin
      @end_city       = destination
      @travel_time    = duration
      @weather_at_eta = nested_weather(weather)
  end

  def nested_weather(weather)
    if @travel_time == 'Impossible Route'
      {}
    else
      @travel_time = @travel_time[:formatted_time]
      {
        temperature: weather[:temp],
        conditions: weather[:weather][0][:description]
      }
    end
  end
end