Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'home#index'

  get '/world_bosses', to: 'world_bosses#index'
  get '/world_bosses/new', to: 'world_bosses#new'
  post 'world_bosses', to: 'world_bosses#create'
  get '/world_bosses/:id', to: 'world_bosses#show'
  get '/world_bosses/:id/loots', to: 'world_boss_loots#index'
  get '/world_bosses/:id/edit', to: 'world_bosses#edit'
  patch '/world_bosses/:id', to: 'world_bosses#update'


  get '/loots', to: 'loots#index'
  get '/loots/:id', to: 'loots#show'

  get '/regions', to: 'regions#index'
  get '/regions/:id', to: 'regions#show'


  get '/locations', to: 'locations#index'
  get '/locations/:id', to: 'locations#show'

  get '/regions/:id/locations', to: 'region_locations#index'



end
