class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.float :rating

      t.timestamps
    end
  end
end
