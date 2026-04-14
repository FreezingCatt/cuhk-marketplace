Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  resources :books
  get 'welcome/index', to: 'welcome#index'
end