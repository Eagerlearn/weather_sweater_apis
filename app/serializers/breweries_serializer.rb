class BreweriesSerializer
  #initially attempted to access "current" but realized that is not accessable from the forecast facade
  #so I created the large service for breweries hoping to access the "forecast" that way
  def self.breweries_list_by_city(forecast, breweries)
    {
      "data": {
        "id": "null",
        "type": "breweries",
        "attributes": {
          "destination": breweries.destination,
          "forecast": {
            "summary": forecast.conditions,
            "temperature": forecast.temp
          },
          "breweries": [
            {
              "id": breweries.id,
              "name": breweries.name,
              "brewery_type": breweries.brewery_type
            },
          ]
        }
      }
    }
  end
end