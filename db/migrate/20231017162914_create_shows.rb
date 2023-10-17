class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.date :date
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
