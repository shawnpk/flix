Rails.application.routes.draw do
  resources :movies do
    resources :reviews
  end
  resources :users

  get "signup", to: "users#new"

  root "movies#index"
end
