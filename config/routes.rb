Rails.application.routes.draw do
  get "movies", to: "movies#index"
  get "movies/:id", to: "movies#show", as: :movie
  get "movies/:id/edit", to: "movies#edit", as: :edit_movie
  patch "movies/:id", to: "movies#update"

  root "movies#index"
end
