class Movie < ApplicationRecord
  has_many :movie_cities
  has_many :hall_movie_shows
  has_many :movie_crews
  has_many :shows, through: :hall_movie_shows
  has_many :cinema_halls, through: :hall_movie_shows
  has_many :cities, through: :movie_cities
  has_many :crews, through: :movie_crews
end
