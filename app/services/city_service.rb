class CityService < BaseService

  def self.get_city_forecast(city)
    coordinates = ForecastService.get_coordinates(city)
    lat = coordinates[:results][0][:locations][0][:latLng][:lat]
    lon = coordinates[:results][0][:locations][0][:latLng][:lng]
    response = open_weather_connection.get('/data/2.5/onecall') do |faraday|
      faraday.params['appid'] = ENV['OW_API_KEY']
      faraday.params['lon'] = lon
      faraday.params['lat'] = lat
      faraday.params['units'] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
