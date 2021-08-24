Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'home#index'
  get '/world_bosses', to: 'world_bosses#index'
  get '/regions', to: 'regions#index'
end
