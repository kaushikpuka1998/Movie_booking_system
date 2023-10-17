class CinemaHallIdInscreen < ActiveRecord::Migration[7.0]
  def change
    add_column :screens, :cinema_hall_id, :integer
  end
end
