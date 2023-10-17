class ChangeColumnNameCinemaseatsTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :cinema_seats, :show_id, :cinema_hall_id
  end
end
