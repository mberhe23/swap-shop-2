Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :listings do
    resources :requests, only: %i[create new]
    resources :swaps, only: %i[new create]
  end

  get "/profile", to: "pages#profile"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
