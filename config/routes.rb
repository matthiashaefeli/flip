Rails.application.routes.draw do
  devise_for :users
  resources :project_types
  resources :projects
  root 'home#index'
end
