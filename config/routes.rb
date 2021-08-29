Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'home#index'

  get '/world_bosses', to: 'world_bosses#index'
  get '/world_bosses/:id', to: 'world_bosses#show'

  get '/regions', to: 'regions#index'
  get '/regions/new', to: 'regions#new'
  get '/regions/:id', to: 'regions#show'
  get '/regions/:id/edit', to: 'regions#edit'
  get '/regions/:id/locations', to: 'region_locations#index'
  post '/regions', to: 'regions#create'
  patch '/regions/:id', to: 'regions#update'
  get '/regions/:id/locations/new', to: 'region_locations#new'
  post '/regions/:id/locations', to: 'region_locations#create'
  delete '/regions/:id', to: 'regions#destroy'

  get '/locations', to: 'locations#index'
  get '/locations/:id', to: 'locations#show'
  get '/locations/:id/edit', to: 'locations#edit'
  patch '/locations/:id', to: 'locations#update'
  delete '/locations/:id', to: 'locations#destroy'

  get '/loots', to: 'loots#index'
  get '/loots/:id', to: 'loots#show'

  get '/world_bosses/:id/loots', to: 'world_bosses#loots_index'
end
