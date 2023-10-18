class AdditionOfCityIdInhalMovieShowsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :hall_movie_shows, :city_id, :integer
  end
end
