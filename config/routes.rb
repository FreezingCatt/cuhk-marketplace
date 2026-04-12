Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  resources :communities

  root 'welcome#index'

  mount ActionCable.server => '/cable'
end
