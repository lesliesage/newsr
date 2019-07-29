Rails.application.routes.draw do

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :follows
  resources :searches
  resources :favorites
  resources :search_terms
  resources :articles
  root 'users#homepage'
  get 'signup', to: 'users#new'
  get 'users/:id', to: 'users#show', as: 'user'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
