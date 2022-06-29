class ForecastService < BaseService

  def self.base_url
    "http://api.openweathermap.org"
  end

  def self.set_api_key(connection)
    connection.params['key'] = ENV['OW_API_KEY']
  end

  def self.get_city_forecast(city)
    coordinates = MapquestGeoService.get_coordinates(city)
    lat = coordinates[:results][0][:locations][0][:latLng][:lat]
    lon = coordinates[:results][0][:locations][0][:latLng][:lng]
    response = connection.get('/data/2.5/onecall') do |connection|
      connection.params['appid'] = ENV['OW_API_KEY']
      connection.params['lon'] = lon
      connection.params['lat'] = lat
      connection.params['units'] = 'imperial'
    end
    format_reponse(response)
  end

end

