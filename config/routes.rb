Rails.application.routes.draw do
  # get 'order_items/create'

  # get 'order_items/update'

  # get 'order_items/destroy'

  # get 'carts/show'

  ActiveAdmin.routes(self)
  # mount ForestLiana::Engine => '/forest'
  devise_for :users
  root to: 'pages#home'
  get '/basket', to: 'pages#basket'

  get '/categories/*id' => 'categories#show'

  # resources :categories, only: :show do
    resources :products, only: [:new, :create, :show, :index]
  # end
    resource :cart, only: [:show] do
      resource :delivery, only: [:show]
    end
    resources :order_items, only: [:create, :update, :destroy]


  mount Attachinary::Engine => "/attachinary"
end
