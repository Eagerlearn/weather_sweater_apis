class BreweriesFacade
  def self.get_breweries_list(location, quantity)
    breweries = BreweriesService.breweries_search(location, quantity)
    # require "pry"; binding.pry
    # brewery_objects = breweries.map do |brewery|
    #   Brewery.new(brewery)
    # end
  end
end