Rails.application.routes.draw do
  root 'homes#index'

  resources :mypages, only: [:index]
  resources :sells, only: [:index, :new] 
  resources :buys, only: [:new, :create]
end
