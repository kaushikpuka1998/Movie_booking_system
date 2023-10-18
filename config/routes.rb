Rails.application.routes.draw do
  get 'movie/movies_by_city'
  get 'movie/movie_shows'
  get 'user/create_user'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #UserController
  post "/signup", to: "user#create_user"
  get '/movies_by_city/:pincode', to: 'movie#movies_by_city'
  get '/movie_shows/:show_id', to: 'movie#movie_shows'
end
