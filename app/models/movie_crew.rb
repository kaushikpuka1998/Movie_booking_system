class MovieCrew < ApplicationRecord
  belongs_to :movie
  belongs_to :crew
end
