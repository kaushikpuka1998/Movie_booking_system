class Movie < ApplicationRecord
  has_many :city_movies
  has_many :hall_movie_shows
  has_many :movie_crews
  has_many :shows, through: :hall_movie_shows
  has_many :cinema_halls, through: :hall_movie_shows
  has_many :cities, through: :city_movies
  has_many :crews, through: :movie_crews

  has_many :unique_cinema_halls, lambda {
                                   distinct
                                 }, through: :hall_movie_shows, source: :cinema_hall
end
