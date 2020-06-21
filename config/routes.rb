Rails.application.routes.draw do
  
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
  match 'employee/:id/approve', to: 'admins#approve_employee', via: [:get, :post], as: 'approve_employee'
  match 'chef/:id/approve', to: 'admins#approve_chef', via: [:get, :post], as: 'approve_chef'
  get 'error', to: "pages#show"


end
