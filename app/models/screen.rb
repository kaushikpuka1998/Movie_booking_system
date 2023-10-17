class Screen < ApplicationRecord
  belongs_to :cinema_hall
  has_many :cinema_seats
end
