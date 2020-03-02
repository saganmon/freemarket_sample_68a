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
  resources :sells, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :buys, only: [:new, :create] do
      collection do
        post :buy
      end
    end

    collection do
      get 'select_category_middle' 
      get 'select_category_small'
      get 'select_shipping_method'
    end
  end

  resources :cards, only: [:new, :create, :show, :destroy] do
    collection do
      post :pay
    end
  end

  resources :homes, only: [:index] do
    collection do 
      get :search
    end
  end

  resources :searches, only: [:index, :show] do
    collection do
      get :sort
      get :detail_search
    end
  end
end
