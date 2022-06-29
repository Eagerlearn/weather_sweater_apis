class BaseService

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
end