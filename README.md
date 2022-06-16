# Weather Sweater
![Weather Sweater (1)](https://user-images.githubusercontent.com/77861247/173090073-d36a5dd9-64a8-49dd-a921-3f6c5d330a6d.jpg)

# Plan you next road trip!
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

## BackEnd Available Endpoints - Postman Collection
* [Click this link](https://www.getpostman.com/collections/03352a860b564709d906)
* Copy the entire text
* Open Postman, select "Import" from top left of page, then "Raw text" from the top line
* Paste the entire text
* Click "Continue", then "Import"
* Check out the endpoint examples - we have calls to the external APIs consumed by our app, as well as demonstrations of the responses returned from our own API endpoints!

## Contributors

* Craig Cardwell [GitHub](https://github.com/Eagerlearn), [LinkedIn](https://www.linkedin.com/in/craiglcardwell/)

