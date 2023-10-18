class AdditionOfCityIdInCinemaHall < ActiveRecord::Migration[7.0]
  def change
    add_column :cinema_halls, :city_id, :integer
  end
end
