class BreweriesService < BaseService
  def self.breweries_search(by_city)
    response = open_brewery_conn.get('/breweries') do |faraday|
      faraday.params['by_city'] = by_city
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
