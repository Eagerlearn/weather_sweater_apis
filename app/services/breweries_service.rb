class BreweriesService < BaseService
  def self.breweries_search(location, quantity)
    city_coordinates = mapquest_conn.get('/geocoding/v1/address') do |faraday|
      faraday.params['location'] = location
    end
    co_ord = JSON.parse(city_coordinates.body, symbolize_names: true)

    lat = co_ord[:results][0][:locations][0][:latLng][:lat]
    lon = co_ord[:results][0][:locations][0][:latLng][:lng]

    city = open_weather_connection.get('/data/2.5/onecall') do |faraday|
      faraday.params['appid'] = ENV['OW_API_KEY']
      faraday.params['lon'] = lon
      faraday.params['lat'] = lat
      faraday.params['units'] = 'imperial'
    end
    forecast = JSON.parse(city.body, symbolize_names: true)

    breweries = open_brewery_conn.get('/breweries') do |faraday|
      faraday.params['by_city'] = location
      faraday.params['per_page'] = quantity
    end
    JSON.parse(breweries.body, symbolize_names: true)
  end
end
