class BreweriesFacade
  def self.get_breweries_list(location, quantity)
    breweries = BreweriesService.breweries_search(location, quantity)
    brewery_objects = breweries.map do |brewery|
      Brewery.new(brewery)
    end
brewery_objects
  end
end

#forecast response not properly integrated in order to pass to serializer