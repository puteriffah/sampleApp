Rails.application.routes.draw do
  root "static_pages#home"

  get "static_pages/help"
  get "users/show"
  get "users/new"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users
end
