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
  resources :works
  resources :data_managers, only: [:index]
  resources :comments
  root 'home#index'
end
