Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :order, only: [:index, :update]

  resources :carts, only: [:show]

  resources :order_items, only: [:create, :update, :destroy]

  get '/admin', to: 'admin#index', as: 'admin_index'

  devise_scope :user do
    root :to => 'devise/sessions#new'
  end
end
