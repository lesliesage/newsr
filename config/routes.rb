Rails.application.routes.draw do

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :follows
  resources :searches
  delete 'favorites/:id', to: 'favorites#destroy', as: 'favorite_delete'
  resources :favorites
  resources :search_terms
  resources :articles
  root 'users#homepage'
  get 'signup', to: 'users#new'
  get 'users/search', to: 'users#show_search', as: 'print_users_search'
  post 'users/search', to: 'users#search', as: 'users_search'
  get 'users/:id', to: 'users#show', as: 'user'
  resources :users
  get '/stats', to: 'application#stats'

end
