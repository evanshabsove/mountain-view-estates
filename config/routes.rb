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

  patch '/admin/update_special/:id', to: 'admin#update_special', as: 'admin_update_special'

  patch '/admin/update_inventory/:id', to: 'admin#update_inventory', as: 'admin_update_inventory'

  delete '/admin/delete_special/:id', to: 'admin#delete_special', as: 'admin_delete_special'

  delete '/admin/delete_inventory/:id', to: 'admin#delete_inventory', as: 'admin_delete_inventory'

  post '/admin/create', to: 'admin#create_product', as: 'admin_create_product'

  post 'create_user' => 'admin#create', as: :create_user

  post 'selected_user' => 'admin#selected_user', as: :selected_user

  post 'create_product_user' => 'admin#product_user', as: :product_user

  delete 'delete_product_user' => 'admin#delete_product', as: :delete_product

  devise_scope :user do
    root :to => 'devise/sessions#new'
  end
end
