class CreateShowSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :show_seats do |t|
      t.references :show, null: false, foreign_key: true
      t.references :cinema_seat, null: false, foreign_key: true
      t.boolean :booked

      t.timestamps
    end
  end
end
