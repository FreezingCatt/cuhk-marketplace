Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index', to: 'welcome#index'
end