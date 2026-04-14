Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  resources :books
  resources :messages
  resources :users do
    resources :ratings
  end
  resources :ratings, only: [:new, :create]
  get 'welcome/index', to: 'welcome#index'
end