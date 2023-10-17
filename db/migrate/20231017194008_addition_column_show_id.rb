class AdditionColumnShowId < ActiveRecord::Migration[7.0]
  def change
    add_column :cinema_seats, :show_id, :integer
  end
end
