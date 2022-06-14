class BreweriesFacade
  def self.get_breweries_list(location, quantity)
    breweries = BreweriesService.breweries_search(location, quantity)
    brewery_objects = breweries.map do |brewery|
      Brewery.new(brewery)
    end
    [breweries]
  end
end