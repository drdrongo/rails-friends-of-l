Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  get '/dashboard', to: "users#dashboard"
  resources :events do
    resources :tickets, only: [:create]
   end
  resources :tickets, only: [:update]
end
