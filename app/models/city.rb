class City < ApplicationRecord
  has_many :city_movies
  has_many :cinema_halls
  has_many :movies, through: :city_movies
end
