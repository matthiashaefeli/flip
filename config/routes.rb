Rails.application.routes.draw do
  devise_for :users
  resources :project_types
  resources :projects
  resources :conditions
  resources :providers
  resources :finances
  root 'home#index'
end
