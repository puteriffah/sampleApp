Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    root "static_pages#home"

    get "/home", to: "static_pages#home"
    get "/help", to: "static_pages#help"
    resources :users
    resources :account_activations, only: :edit
    resources :password_resets, except: %i(show index destroy)
    resources :microposts, only: %i(create destroy)
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
  end
end
