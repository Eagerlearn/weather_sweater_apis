# Weather Sweater


# Plan your next road trip!
+ This Backend application was built to expose API endpoints which offer retrieval of weather, travel directions, user registration and login.
+ It was built to meet the demands of our FrontEnd stakeholder's wireframe specifications, as well as for broad base of FrontEnd API consumers.
+ The features include providing valid driving directions, and error handling for edge cases, in addition it provides location based images for dynamic rendering
+ Consuming Mapquest's Geocoding and Directions APIs along with the pinpoint weather of OpenWeather's API, it then integrates Unsplash's extensive image API.


## Versions
* Ruby Version - 2.7.4
* Rails - 5.2.8

## Setup
* Clone this repo https://github.com/Eagerlearn/weather_sweater_apis
* `bundle install`
* `rails db:{drop,create,migrate}`
* run `bundle exec rspec` to run our RSpec testing suite
* MAPQUEST_API_KEY: <Your Key Here>
* WEATHER_API_KEY: <Your Key Here>
* UNSPLASH_API_KEY: <Your Key Here>

## BackEnd Available Endpoints
* [Mapquest Directions](http://www.mapquestapi.com/directions/v2/route)
* [Mapquest Geocoding](http://www.mapquestapi.com/geocoding/v1/address)
* [OpenWeather](https://api.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key})

## Contributors

* Craig Cardwell [GitHub](https://github.com/Eagerlearn), [LinkedIn](https://www.linkedin.com/in/craiglcardwell/)

