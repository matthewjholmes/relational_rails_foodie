Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/restaurants', to: 'restaurants#index'
  get '/restaurants/:id', to: 'restaurants#show'
  get '/restaurants/new', to: 'restaurants#new'
  post '/restaurants', to: 'restaurants#create'

  get '/farmers_markets', to: 'farmers_markets#index'
  get '/farmers_markets/:id', to: 'farmers_markets#show'

  get 'dishes', to: 'dishes#index'
  get 'dishes/:id', to: 'dishes#show'

  get 'produces', to: 'produces#index'
  get 'produces/:id', to: 'produces#show'

  get 'restaurants/:restaurant_id/dishes', to: 'restaurant_dishes#index'

  get 'farmers_markets/:farmers_market_id/produces', to: 'farmers_market_produces#index'
end
