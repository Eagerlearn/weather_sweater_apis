class BaseService

  def self.open_weather_connection
      Faraday.new('http://api.openweathermap.org') do |faraday|
    end
  end

  def self.mapquest_conn
      Faraday.new('http://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['MAPQ_API_KEY']
    end
  end

  def self.unsplash_conn
      Faraday.new('https://api.unsplash.com') do |faraday|
      faraday.params['client_id'] = ENV['UNSPLASH_ACCESS_KEY']
    end
  end

  def self.open_brewery_conn
    Faraday.new('https://api.openbrewerydb.org') do |faraday|
    end
  end
end