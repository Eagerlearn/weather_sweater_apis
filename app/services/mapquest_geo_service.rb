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

    response = connection.get('/directions/v2/route') do |connection|
      connection.params['from'] = origin
      connection.params['to'] = destination
    end
    format_reponse(response)
  end
end