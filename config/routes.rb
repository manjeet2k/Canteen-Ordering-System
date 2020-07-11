Rails.application.routes.draw do
  
  get 'orders/new'
  root 'pages#home'

  resources :companies
  resources :users, except: [:new]
  resources :employees
  resources :chefs
  resources :food_stores
  resources :food_items
  resources :food_categories


  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get   'dashboard', to: 'admins#dashboard'
  match 'chef/:id/approve',     to: 'admins#approve_chef',     via: [:get, :post], as: 'approve_chef'
  match 'employee/:id/approve', to: 'admins#approve_employee', via: [:get, :post], as: 'approve_employee'

  get 'error',    to: "pages#show"
  get 'menu', to: "pages#menu"
  
  post 'carts/add'
  get 'cart', to: 'carts#show'
  get 'orders', to: 'carts#order_show', as: 'order_show'
  patch 'cart_item/:id/update', to: 'cart_items#update', as: 'item_update'
  delete 'cart_item/:id', to: 'cart_items#delete', as: 'item_delete'
  patch 'order/:id', to: 'carts#update', as: 'cart_update'
  
end
