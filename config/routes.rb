Rails.application.routes.draw do

  root to: 'events#index'
  devise_for :users
  resources :topics, only: [:index, :show]

  authenticate :user do
    resources :saved_searches, except: [:show]
  end

  resources :events, only: [:index, :show]
end
