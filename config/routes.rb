Rails.application.routes.draw do
  get 'user/create_user'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #UserController
  post "/signup", to: "user#create_user"
end
