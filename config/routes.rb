Rails.application.routes.draw do
  resources :users, only: [:create, :show]

  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"

  get "/me", to: "users#show"

  delete "/logout", to: "sessions#destroy"

end
