Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :order, only: [:index, :update]

  resources :carts, only: [:show]

  resources :order_items, only: [:create, :update, :destroy]

  get '/admin', to: 'admin#index', as: 'admin_index'

  get '/admin/new', to: 'admin#new', as: 'admin_new'

  post 'create_user' => 'admin#create', as: :create_user

  post 'create_product_user' => 'admin#product_user', as: :product_user

  devise_scope :user do
    root :to => 'devise/sessions#new'
  end
end
