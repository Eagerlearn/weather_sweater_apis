class BackgroundsService < BaseService

  def self.base_url
    "https://api.unsplash.com"
  end

  def self.set_api_key(connection)
    connection.params['client_id'] = ENV['UNSPLASH_ACCESS_KEY']
  end

  def self.search_for_backgrounds(city)

    response = connection.get('/search/photos') do |connection|
      connection.params['query'] = city
      connection.params['orientation'] = 'landscape'
    end
    format_reponse(response)
  end
end