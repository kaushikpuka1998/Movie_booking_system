class HallMovieShow < ApplicationRecord
  belongs_to :cinema_hall
  belongs_to :movie
  belongs_to :show
end
