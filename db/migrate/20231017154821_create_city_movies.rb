class CreateCityMovies < ActiveRecord::Migration
  def change
    create_table :city_movies do |t|
      t.integer :city_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
