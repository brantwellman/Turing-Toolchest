Rails.application.routes.draw do
  root 'tools#index'
  resources :users, only: [:new, :create, :show] do
    resources :tools
  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
