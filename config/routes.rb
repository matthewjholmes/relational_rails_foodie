Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/restaurants', to: 'restaurants#index'
  get '/restaurants/:id', to: 'restaurants#show'

  get '/farmers_markets', to: 'farmers_markets#index'
  get '/farmers_markets/:id', to: 'farmers_markets#show'

  get 'dishes', to: 'dishes#index'
end
