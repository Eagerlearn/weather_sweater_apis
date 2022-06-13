class ForecastSerializer
  def self.forecast_list(current, daily, hourly)
    {
      data: {
        id: nil,
        type: "forecast",
        attributes: {
          current_weather: {
            datetime: current.datetime,
            sunrise: current.sunrise,
            sunset: current.sunset,
            temp: current.temp,
            feels_like: current.feels_like,
            uvi: current.uvi,
            visibility: current.visibility,
            conditions: current.conditions,
            icon: current.icon
          },
          daily_weather: daily.map do |day|
            {
              date: day.date,
              sunrise: day.sunrise,
              sunset: day.sunset,
              max_temp: day.max_temp,
              min_temp: day.min_temp,
              conditions: day.conditions,
              icon: day.icon
            }
          end,
          hourly_weather: hourly.map do |hour|
            {
              time: hour.time,
              temp: hour.temp,
              conditions: hour.conditions,
              icon: hour.icon
            }
          end
        }
      }
    }
  end
end