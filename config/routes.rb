Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # mount ForestLiana::Engine => '/forest'
  devise_for :users
  root to: 'pages#home'
  get '/basket', to: 'pages#basket'

  get '/categories/*id' => 'categories#show'

  # resources :categories, only: :show do
    resources :products, only: [:new, :show, :index]
  # end

  mount Attachinary::Engine => "/attachinary"
end
