class AddMovieIdInshowTable < ActiveRecord::Migration[7.0]
  def change
    add_column :shows, :movie_id, :integer
  end
end
