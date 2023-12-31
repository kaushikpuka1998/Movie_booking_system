class Show < ApplicationRecord
  has_many :hall_movie_shows
  has_many :cinema_seats
  has_many :cinema_halls, through: :hall_movie_shows
  has_many :show_seats, through: :cinema_seats
  has_many :screens, through: :hall_movie_shows
  has_many :movies, through: :hall_movie_shows
end
