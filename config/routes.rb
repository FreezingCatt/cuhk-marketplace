Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  resources :books do
    resources :ratings, only: [:create]
  end
  get 'welcome/index', to: 'welcome#index'
end