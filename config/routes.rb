Rails.application.routes.draw do
  root 'homes#index'

  resources :mypages, only: [:index]
  resources :sells, only: [:new, :show] 
  resources :buys, only: [:new, :create]
  resources :homes, only: [:index]
  

end
