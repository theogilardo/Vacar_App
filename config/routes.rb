Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cars do
    resources :requests, only: [:new, :create]
  end

  resources :requests, except: [:new, :create, :index] do
    resources :reviews, only: []
  end

 resources :dashboards
  get "/dashboard/owner", to: "dashboards#owner"
  get "/dashboard/user", to: "dashboards#user"
end
