Rails.application.routes.draw do

  get 'grayscale/index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :follows
  resources :searches
  delete 'favorites/:id', to: 'favorites#destroy', as: 'favorite_delete'
  resources :favorites
  resources :articles
  root 'users#homepage'
  get 'signup', to: 'users#new'
  get 'users/search', to: 'users#show_search', as: 'print_users_search'
  post 'users/search', to: 'users#search', as: 'users_search'
  get 'users/:id', to: 'users#show', as: 'user'
  get '/edit', to: 'users#edit'
  patch '/edit', to: 'users#update'
  resources :users
  get '/stats', to: 'application#stats'
  post '/results', to: 'favorites#create_and_save'
  get '/qr', to: 'users#qr_page'
  get 'searches', to: 'users#homepage'
end
