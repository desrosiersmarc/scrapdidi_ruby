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

  get '/cart/cheque', to: 'pages#cheque'
  get '/cart/virement', to: 'pages#virement'
  get '/cart/especes', to: 'pages#especes'

  get '/categories/*id' => 'categories#show'

  # resources :categories, only: :show do
    resources :products, only: [:new, :create, :show, :index]
  # end
    resource :cart, only: [:show] do
      resource :delivery, only: [:show]
      resource :summary, only: [:show]
      resources :payments, only: [:new, :create]
    end

    resources :order_items, only: [:create, :update, :destroy]
    resources :orders, only: [:edit, :update]


  mount Attachinary::Engine => "/attachinary"
end
