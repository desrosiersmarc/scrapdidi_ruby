Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'

  # get 'basket', to: 'pages#basket'
  get '/cart/check', to: 'pages#check'
  get '/cart/transfer', to: 'pages#transfer'
  get '/cart/cash', to: 'pages#cash'
  get 'results', to: 'pages#results'
  get 'cgv', to: 'pages#cgv'
  get 'legal', to: 'pages#legal'

  get '/categories/*id' => 'categories#show'

  resources :products, only: [:new, :create, :show, :index]
  resource :cart, only: [:show] do
    resource :delivery, only: [:show]
  end

  resources :order_items, only: [:create, :update, :destroy]
  resources :orders, only: [:index, :show, :edit, :update] do
    resources :payments, only: [:new, :create]
  end

  mount Attachinary::Engine => "/attachinary"
end
