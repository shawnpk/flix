Rails.application.routes.draw do
  resource :session, only: [ :new, :create, :destroy ]

  resources :movies do
    resources :favorites, only: [ :create, :destroy ]
    resources :reviews
  end
  resources :users

  get "signup", to: "users#new"
  get "signin", to: "sessions#new"

  root "movies#index"
end
