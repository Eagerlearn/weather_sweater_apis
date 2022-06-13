class DailyForecast

  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date       = convert_time_format(data[:dt])
    @sunrise    = convert_time_format(data[:sunrise])
    @sunset     = convert_time_format(data[:sunset])
    @max_temp   = data[:temp][:max]
    @min_temp   = data[:temp][:min]
    @conditions = data[:weather][0][:description]
    @icon       = data[:weather][0][:icon]
  end

  def convert_time_format(time)
    Time.at(time)
  end
end