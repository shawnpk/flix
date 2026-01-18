Rails.application.routes.draw do
  resources :genres
  resource :session, only: [ :new, :create, :destroy ]

  resources :movies do
    resources :favorites, only: [ :create, :destroy ]
    resources :reviews
  end
  resources :users

  get "movies/filter/:filter", to: "movies#index", as: :filtered_movies
  get "signup", to: "users#new"
  get "signin", to: "sessions#new"

  root "movies#index"
end
