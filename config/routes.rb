Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :makers, except: [:edit, :update, :destroy] do

    collection do
      get :map
    end
    resources :reviews, only: [:new, :create]

  end
  resources :products, only: [:new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # devise_for :users
  # Defines the root path route ("/")
  # root "posts#index"
end
