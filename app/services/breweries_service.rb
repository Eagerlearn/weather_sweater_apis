class BreweriesService < BaseService
  def self.breweries_search(location, quantity)
    response = open_brewery_conn.get('/breweries') do |faraday|
      faraday.params['by_city'] = location
      faraday.params['per_page'] = quantity
    end
    x = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
  end
end
