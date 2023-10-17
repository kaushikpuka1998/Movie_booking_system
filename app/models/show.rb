class Show < ApplicationRecord
  has_many :hall_movie_shows
  has_many :cinema_halls, through: :hall_movie_shows
end
