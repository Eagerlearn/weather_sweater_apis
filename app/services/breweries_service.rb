class BreweriesService < BaseService
  def self.breweries_search(location, quantity)
    city_coordinates = mapquest_conn.get('/geocoding/v1/address') do |faraday|
      faraday.params['location'] = location
    end
    json = JSON.parse(city_coordinates.body, symbolize_names: true)

    lat = json[:results][0][:locations][0][:latLng][:lat]
    lon = json[:results][0][:locations][0][:latLng][:lng]

    city_forecast = open_weather_connection.get('/data/2.5/onecall') do |faraday|
      faraday.params['appid'] = ENV['OW_API_KEY']
      faraday.params['lon'] = lon
      faraday.params['lat'] = lat
      faraday.params['units'] = 'imperial'
    end
    JSON.parse(city_forecast.body, symbolize_names: true)

    response = open_brewery_conn.get('/breweries') do |faraday|
      faraday.params['by_city'] = location
      faraday.params['per_page'] = quantity
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
