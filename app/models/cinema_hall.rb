class CinemaHall < ApplicationRecord
  has_many :hall_movie_shows
  has_many :movies, through: :hall_movie_shows
  has_many :shows, through: :hall_movie_shows
  has_many :screens

  scope :by_city, lambda { |pincode|
    joins("INNER JOIN cities ON
      cities.id = cinema_halls.city_id")
      .where("cities.pincode = #{pincode}")
  }
end
