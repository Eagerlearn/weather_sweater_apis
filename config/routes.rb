Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :forecast, only: [:index]
      get '/backgrounds', to: 'backgrounds#show'
      post '/users', to: 'users#registration'
      post '/sessions', to: 'sessions#login'
      post '/road_trip', to: 'road_trips#create'
    end
  end
end
