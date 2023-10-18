class HallMovieShow < ApplicationRecord
  belongs_to :cinema_hall
  belongs_to :movie
  belongs_to :show
  belongs_to :screen

  validates :show_id, uniqueness: { scope: %i[cinema_hall_id screen_id movie_id] }
end
