Rails.application.routes.draw do
  
  post 'login', to: 'auth#login'

  resources :users, only: [:show, :create, :destroy]
  resources :orders, only: [:index, :show, :create] do
    resources :order_details, only: [:create]
  end

  resources :products, only: [:index, :show, :create, :destroy]
end
