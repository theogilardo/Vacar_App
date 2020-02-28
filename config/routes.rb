Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/about_us", to: 'pages#about_us'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cars do
    resources :requests, only: [:new, :create]
  end
    delete "/cars/:id", to:"cars#destroy", as: :destroy_car

  resources :requests, except: [:new, :create, :index] do
    resources :reviews, only: [:new, :create, :index]
    member do
      post 'accept'
      post 'decline'
    end
  end
  delete "/requests/:id", to:"requests#destroy", as: :destroy_request
  resources :dashboards

  get "/dashboard/owner", to: "dashboards#owner"
  get "/dashboard/user", to: "dashboards#user"
end
