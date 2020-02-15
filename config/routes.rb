Rails.application.routes.draw do
  root 'temporarys#index'

  resources :sells, only: [:index, :new] 
end
