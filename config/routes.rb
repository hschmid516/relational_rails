Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'home#index'

  get '/world_bosses', to: 'world_bosses#index'
  get '/world_bosses/:id', to: 'world_bosses#show'

  get '/regions', to: 'regions#index'
  get '/regions/:id', to: 'regions#show'

  get '/locations', to: 'locations#index'
  get '/locations/:id', to: 'locations#show'
end
