Rails.application.routes.draw do
  # get 'order_items/create'

  # get 'order_items/update'

  # get 'order_items/destroy'

  # get 'carts/show'

  ActiveAdmin.routes(self)
  # mount ForestLiana::Engine => '/forest'
  devise_for :users
  root to: 'pages#home'
  # get '/basket', to: 'pages#basket'

  get '/cart/check', to: 'pages#check'
  get '/cart/transfer', to: 'pages#transfer'
  get '/cart/cash', to: 'pages#cash'

  get '/categories/*id' => 'categories#show'

  # resources :categories, only: :show do
    resources :products, only: [:new, :create, :show, :index]
  # end
    resource :cart, only: [:show] do
      resource :delivery, only: [:show]
      # resource :summary, only: [:show]
    end

    resources :order_items, only: [:create, :update, :destroy]
    resources :orders, only: [:show, :edit, :update] do
      resources :payments, only: [:new, :create]
    end

  mount Attachinary::Engine => "/attachinary"
end
