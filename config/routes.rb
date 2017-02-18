Rails.application.routes.draw do
  # mount ForestLiana::Engine => '/forest'
  devise_for :users
  root to: 'pages#home'
  get '/basket', to: 'pages#basket'

  get '/categories/*id' => 'categories#show'

  # resources :categories, only: :show do
    resources :products, only: [:show, :index]
  # end

  mount Attachinary::Engine => "/attachinary"
end
