class BackgroundsService < BaseService
  def self.search_for_backgrounds(city)
    response = unsplash_conn.get('/search/photos') do |faraday|
      faraday.params['query'] = city
      faraday.params['orientation'] = 'landscape'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end