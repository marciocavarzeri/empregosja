Rails.application.routes.draw do

  root 'home#index'

  resources :jobs, only: [:new, :show, :create, :edit, :update]
  resources :companies, only: [:show]
end
