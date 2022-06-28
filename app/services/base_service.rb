class BaseService

  # def self.open_weather_connection
  #     Faraday.new('http://api.openweathermap.org') do |faraday|
  #   end
  # end

  # def self.mapquest_conn
  #     Faraday.new('http://www.mapquestapi.com') do |faraday|
  #     faraday.params['key'] = ENV['MAPQ_API_KEY']
  #   end
  # end

  def self.connection
    Faraday.new(base_url).tap do |connection|
      set_api_key(connection)
    end
  end

  def self.set_api_key(connection)
    # no-op
  end

  def self.format_reponse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.unsplash_conn
      Faraday.new('https://api.unsplash.com') do |faraday|
      faraday.params['client_id'] = ENV['UNSPLASH_ACCESS_KEY']
    end
  end
end