class CityMovie < ApplicationRecord
  belongs_to :city
  belongs_to :movie
end
