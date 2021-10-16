Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/restaurants', to: 'restaurants#index'
  get '/restaurants/new', to: 'restaurants#new'
  post '/restaurants', to: 'restaurants#create'
  get '/restaurants/:id', to: 'restaurants#show'
  get '/restaurants/:id/edit', to: 'restaurants#edit'
  patch '/restaurants/:id', to: 'restaurants#update'

  get '/farmers_markets', to: 'farmers_markets#index'
  get '/farmers_markets/new', to: 'farmers_markets#new'
  post '/farmers_markets', to: 'farmers_markets#create'
  get '/farmers_markets/:id', to: 'farmers_markets#show'
  get '/farmers_markets/:id/edit', to: 'farmers_markets#edit'
  patch '/farmers_markets/:id', to: 'farmers_markets#update'

  get '/dishes', to: 'dishes#index'
  get '/dishes/:id', to: 'dishes#show'
  get '/dishes/:id/edit', to: 'dishes#edit'
  patch '/dishes/:id', to: 'dishes#update'

  get '/produces', to: 'produces#index'
  get '/produces/:id', to: 'produces#show'
  get '/produces/:id/edit', to: 'produces#edit'
  patch '/produces/:id', to: 'produces#update'

  get '/restaurants/:restaurant_id/dishes', to: 'restaurant_dishes#index'
  get '/restaurants/:restaurant_id/dishes/new', to: 'restaurant_dishes#new'
  post '/restaurants/:restaurant_id/dishes', to: 'restaurant_dishes#create'

  get '/farmers_markets/:farmers_market_id/produces', to: 'farmers_market_produces#index'
  get '/farmers_markets/:farmers_market_id/produces/new', to: 'farmers_market_produces#new'
  post '/farmers_markets/:farmers_market_id/produces', to: 'farmers_market_produces#create'
end
