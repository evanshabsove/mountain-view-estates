Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :order, only: [:index, :update]

  resources :carts, only: [:show]

  resources :order_items, only: [:create, :update, :destroy]

  get '/order/items', to: 'order#items', as: 'all_items'

  get '/admin', to: 'admin#index', as: 'admin_index'

  get '/admin/new', to: 'admin#new', as: 'admin_new'

  get '/admin/products', to: 'admin#products', as: 'admin_products'

  patch '/admin/update/:id', to: 'admin#update', as: 'admin_update'

  delete '/admin/delete/:id', to: 'admin#delete', as: 'admin_delete'

  post '/admin/create', to: 'admin#create_product', as: 'admin_create_product'

  post 'create_user' => 'admin#create', as: :create_user

  post 'selected_user' => 'admin#selected_user', as: :selected_user

  post 'create_product_user' => 'admin#product_user', as: :product_user

  delete 'delete_product_user' => 'admin#delete_product', as: :delete_product

  devise_scope :user do
    root :to => 'devise/sessions#new'
  end
end
