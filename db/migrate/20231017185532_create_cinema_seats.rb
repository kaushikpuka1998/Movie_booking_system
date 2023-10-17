class CreateCinemaSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :cinema_seats do |t|
      t.string :row
      t.integer :number
      t.references :show, null: false, foreign_key: true

      t.timestamps
    end
  end
end
