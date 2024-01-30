Rails.application.routes.draw do
  resources :books
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "books#index"

  resources :books do
    member do
      get :delete
      get :details
    end
  end
end
