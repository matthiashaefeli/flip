Rails.application.routes.draw do
  devise_for :users
  resources :project_types
  resources :projects
  resources :conditions
  resources :providers
  resources :finances
  resources :vendors
  resources :realtors
  resources :lenders
  resources :materials
  resources :contractors
  root 'home#index'
end
