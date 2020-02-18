Rails.application.routes.draw do
  devise_for :users, controllers:  { 
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'select_signup', to: 'users/registrations#select_signup'
    get 'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
  end

  root 'temporarys#index'

end
