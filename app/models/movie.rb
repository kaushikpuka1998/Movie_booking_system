class Movie < ApplicationRecord
  has_many :movie_cities
  has_many :cities, through: :movie_cities
end
