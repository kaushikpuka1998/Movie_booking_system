class CinemaHall < ApplicationRecord
  has_many :hall_movie_shows
  has_many :movies, through: :hall_movie_shows
  has_many :shows, through: :hall_movie_shows
end
