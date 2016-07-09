Rails.application.routes.draw do

  root 'home#index'

  resources :jobs, only: [:new, :show, :create]
end
