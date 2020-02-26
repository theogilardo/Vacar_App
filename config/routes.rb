Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cars do

    resources :reviews
  end
  resources :requests, as: :documents
  get "requests/:id", to: "requests#destroy", as: "delete_request"
  resources :dashboards
  get "/dashboard/owner", to: "dashboards#owner"
  get "/dashboard/user", to: "dashboards#user"
end
