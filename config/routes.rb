Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cars

  resources :requests do
    resources :reviews
  end
  get "/dashboard/request", to: "dashboard#request"
  get "/dashboard/my_request", to: "dashboard#my_request"
end
