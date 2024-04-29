Rails.application.routes.draw do

  resources :users
  resources :orders, only: [:index, :show, :create] do
    resources :order_details, only: [:create]
  end

  resources :products, only: [:index, :show, :create, :destroy]
end
