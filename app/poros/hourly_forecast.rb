class HourlyForecast

  attr_reader :time,
              :temp,
              :conditions,
              :icon

  def initialize(data)
    @time       = convert_time_format(data[:dt])
    @temp       = data[:temp]
    @conditions = data[:weather][0][:description]
    @icon       = data[:weather][0][:icon]
  end

  def convert_time_format(time)
    Time.at(time)
  end
end