class BreweriesSerializer
  #initially attempted to access "current" but realized that is not accessable from the forecast facade
  #so I created the large service for breweries hoping to access the "forecast" that way
  def self.breweries_list_by_city(list_of_breweries, city_forecast)
    {
      "data": {
        "id": "null",
        "type": "breweries",
        "attributes": {
          "destination": list_of_breweries[0].destination,
          "forecast": {
            "summary": city_forecast[0].conditions,
            "temperature": city_forecast[0].temp
          },
          "breweries": list_of_breweries.map do |brewery|[
            {
              "id": brewery.id,
              "name": brewery.name,
              "brewery_type": brewery.brewery_type
            },
          ]
      end
        }
      }
    }
  end
end