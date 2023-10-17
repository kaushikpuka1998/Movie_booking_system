class ShowSeat < ApplicationRecord
  belongs_to :show
  belongs_to :cinema_seat
end
