Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  devise_for :users
  root to: 'pages#home'
  get '/basket', to: 'pages#basket'
  get '/scrapbooking', to: 'pages#scrapbooking'
    resources :products, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Attachinary::Engine => "/attachinary"
end
