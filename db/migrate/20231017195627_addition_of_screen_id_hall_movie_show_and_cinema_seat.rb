class AdditionOfScreenIdHallMovieShowAndCinemaSeat < ActiveRecord::Migration[7.0]
  def change
    add_column :cinema_seats, :screen_id, :integer
    add_column :hall_movie_shows, :screen_id, :integer
  end
end
