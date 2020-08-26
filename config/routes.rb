Rails.application.routes.draw do

  root "pages#home"

  resources :employee_profiles do
    collection do
      get :dashboard
      get :order_history
      get :favourite_order
    end
  end

  resources :chef_profiles do
    collection do
      get :dashboard
      get :orders
      get :gallery
    end
    
    member do
      get :order_update
      patch :order_update
    end
  end

  resources :user_profiles do
    collection do
      get :dashboard
      get :order_history
      get :favourite_order
    end
  end

  resources :companies
  resources :users, except: [:new]
  resources :food_stores
  resources :food_items
  resources :food_categories
  resources :reviews


  get    "signup", to: "users#new"
  get    "login" , to: "sessions#new"
  post   "login" , to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "auth/facebook/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")

  get "dashboard",    to: "admins#dashboard"
  get "admin/orders", to: "admins#orders"
  get "order/:id/approve", to: "admins#approve_order", as: "approve_order"
  get "chef/:id/approve",     to: "admins#approve_chef", as: "approve_chef"
  get "employee/:id/approve", to: "admins#approve_employee", as: "approve_employee"
  get "chef/:id/reject",     to: "admins#reject_chef", as: "reject_chef"
  get "employee/:id/reject", to: "admins#reject_employee", as: "reject_employee"
  get "store/:id", to: "admins#hide_store", as: "store_indexing_toggle"
  get "admin/credits", to: "admins#provide_credits", as: "admin_credit"

  get "error", to: "pages#show"
  get "notification", to: "pages#notification"
  get "notification/clear", to: "pages#delete_notifications"
  get "reset", to: "pages#reset_filters"

  get "messages/index"
  post "messages/create"
  
  post   "carts/add"
  get    "cart",   to: "carts#show"
  get    "orders", to: "carts#order_show", as: "order_show"
  get    "cart/:id/reorder", to: "carts#reorder", as: "reorder_cart"
  get    "cart/:id/favourite", to: "carts#set_favourite", as: "set_favourite"
  patch  "cart_item/:id/update", to: "cart_items#update", as: "item_update"
  patch  "order", to: "carts#order", as: "cart_order"
  delete "cart_item/:id", to: "cart_items#delete", as: "item_delete"  
end