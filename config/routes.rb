Rails.application.routes.draw do
  resources :follows
  resources :searches
  resources :favorites
  resources :search_terms
  resources :articles
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
