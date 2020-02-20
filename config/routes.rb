Rails.application.routes.draw do
  devise_for :users, controllers:  { 
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'select_signup', to: 'users/registrations#select_signup'
    get 'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
  end

  root 'homes#index'

  resources :mypages, only: [:index]
  resources :sells, only: [:new, :create, :show, :edit] do
    collection do
      get 'select_category_middle' 
      get 'select_category_small'
    end
  end
  resources :buys, only: [:new, :create]
  resources :homes, only: [:index]

end
