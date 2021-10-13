Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/restaurants', to: 'restaurants#index'

  get '/farmers_markets', to: 'farmers_markets#index'
end
