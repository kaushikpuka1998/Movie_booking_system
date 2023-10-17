class CreateHallMovieShows < ActiveRecord::Migration[7.0]
  def change
    create_table :hall_movie_shows do |t|
      t.integer :cinema_hall_id
      t.integer :movie_id
      t.integer :show_id

      t.timestamps
    end
  end
end
