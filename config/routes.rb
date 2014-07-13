Rails.application.routes.draw do

  resources :posts
  post 'post/modal', to:'posts#modal', as: :post_modal

  get 'search', to: 'search#index'
  get 'search/results', to: 'search#results'

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
             controllers: {omniauth_callbacks: "omniauth_callbacks"}


  get 'guide', to: 'home#guide'
  root 'home#index'

  get 'sign_up/modal', to:'home#sign_up_modal', as: :sign_up_modal
end