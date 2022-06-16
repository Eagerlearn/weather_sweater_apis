class MapquestGeoService < BaseService
  def self.get_coordinates(city)

    response = mapquest_conn.get('/geocoding/v1/address') do |faraday|
      faraday.params['location'] = city
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_trip_directions(origin, destination)

    response = mapquest_conn.get('/directions/v2/route') do |faraday|
      faraday.params['from'] = origin
      faraday.params['to'] = destination
    end
    route = JSON.parse(response.body, symbolize_names: true)
    dest_co_ords = get_coordinates(destination)
    lat = dest_co_ords[:results][0][:locations][0][:latLng][:lat]
    lon = dest_co_ords[:results][0][:locations][0][:latLng][:lng]

    city = open_weather_connection.get('/data/2.5/onecall') do |faraday|
      faraday.params['appid'] = ENV['OW_API_KEY']
      faraday.params['lon'] = lon
      faraday.params['lat'] = lat
      faraday.params['units'] = 'imperial'
    end
    forecast = JSON.parse(city.body, symbolize_names: true)
    require "pry"; binding.pry
  end
end