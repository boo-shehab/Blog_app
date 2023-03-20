Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "user#index"

  resources :user, only: [:index, :show] do
    resources :post, only: [:index, :show, :new, :create, :destroy ] do
      resources :comment, only: [:index, :new, :create, :destroy] 
      resources :like, only: [:create] 
    end
  end

end
