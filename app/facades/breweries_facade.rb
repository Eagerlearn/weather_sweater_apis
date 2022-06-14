class BreweriesFacade
  def self.get_breweries_list(by_city)
    breweries = BreweriesService.breweries_search(by_city)
    brewery_objects = breweries.each do |brewery|
      x = Brewery.new(brewery)
    end
  require "pry"; binding.pry  
  end
end