class CreateMovieCrews < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_crews do |t|
      t.integer :movie_id
      t.integer :crew_id

      t.timestamps
    end
  end
end
