class RemoveAndAdditonOfColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :shows, :movie_id, :integer
  end
end
