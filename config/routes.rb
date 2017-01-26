Rails.application.routes.draw do
  # mount ForestLiana::Engine => '/forest'
  devise_for :users
  root to: 'pages#home'
  get '/basket', to: 'pages#basket'

  get '/categories/*id' => 'categories#show'
    resources :products, only: :show

  mount Attachinary::Engine => "/attachinary"
end
