Rails.application.routes.draw do
  
  root 'pages#home'

  resources :companies
  resources :users

  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


end
