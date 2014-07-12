Rails.application.routes.draw do
  get 'search', to: 'search#index'

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
             controllers: {omniauth_callbacks: "omniauth_callbacks"}

  root 'home#index'
end