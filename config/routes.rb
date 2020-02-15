Rails.application.routes.draw do
  root 'mypages#index'

  resources :sells, only: [:index, :new] 
end
