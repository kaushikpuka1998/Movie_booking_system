class CreateCinemaHallScreens < ActiveRecord::Migration[7.0]
  def change
    create_table :cinema_hall_screens do |t|
      t.references :cinema_hall, null: false, foreign_key: true
      t.references :screen, null: false, foreign_key: true

      t.timestamps
    end
  end
end
