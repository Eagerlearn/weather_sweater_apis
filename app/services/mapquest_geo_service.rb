class MapquestGeoService < BaseService

  def self.base_url
    "http://www.mapquestapi.com"
  end

  def self.set_api_key(connection)
    connection.params['key'] = ENV['MAPQ_API_KEY']
  end

  def self.get_coordinates(city)

    response = connection.get('/geocoding/v1/address') do |connection|
      connection.params['location'] = city
    end
    format_reponse(response)
  end

  def self.get_trip_directions(origin, destination)

    response = mapquest_conn.get('/directions/v2/route') do |faraday|
      faraday.params['from'] = origin
      faraday.params['to'] = destination
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end