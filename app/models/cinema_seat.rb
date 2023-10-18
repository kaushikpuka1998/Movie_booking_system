class CinemaSeat < ApplicationRecord
  belongs_to :show
  scope :all_show, lambda {
    joins("LEFT JOIN
      show_seats ON show_seats.cinema_seat_id = cinema_seats.id")
      .select(:id, :row, :number, 'show_seats.booked as booked')
  }
end
