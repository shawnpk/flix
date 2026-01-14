Rails.application.routes.draw do
  get "movies", to: "movies#index"
  get "movies/:id", to: "movies#show", as: :movie

  root "movies#index"
end
