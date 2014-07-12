Rails.application.routes.draw do
  get 'search', to: 'search#index'

  resources :authentications

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
             controllers: {omniauth_callbacks: "authentications", registrations: "registrations"}

  get 'home/index'

  match '/profile/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  root 'home#index'
end