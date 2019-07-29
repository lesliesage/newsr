Rails.application.routes.draw do
  get 'sessions/new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'sessions/logout'
  resources :follows
  resources :searches
  resources :favorites
  resources :search_terms
  resources :articles
  resources :users
  # root 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
