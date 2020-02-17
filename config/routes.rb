Rails.application.routes.draw do
  root 'mypages#index'

  resources :homes, only: [:index]
  resources :sells, only: [:index, :new, :show]
end
