class CurrentForecast

  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temp,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(data)
    @datetime   = convert_time_format(data[:current][:dt])
    @sunrise    = convert_time_format(data[:current][:sunrise])
    @sunset     = convert_time_format(data[:current][:sunset])
    @temp       = data[:current][:temp]
    @feels_like = data[:current][:feels_like]
    @humidity   = data[:current][:humidity]
    @uvi        = data[:current][:uvi]
    @visibility = data[:current][:visibility]
    @conditions = data[:current][:weather][0][:description]
    @icon       = data[:current][:weather][0][:icon]
  end

  def convert_time_format(time)
    Time.at(time)
  end
end