Rails.application.routes.draw do

  devise_for :users
  root "items#index"

  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :orders, only: [:index, :new, :create]
end
