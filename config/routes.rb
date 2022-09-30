Rails.application.routes.draw do
  resources :users, only: [:create, :show]

  post "/signup", to: "users#create"
  get "/me", to: "users#show"

end
