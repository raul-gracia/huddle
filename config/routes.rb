Rails.application.routes.draw do
  root to: 'events#index'
  devise_for :users
  resources :topics, only: [:index, :show]
  resources :events, only: [:index, :show]
end
