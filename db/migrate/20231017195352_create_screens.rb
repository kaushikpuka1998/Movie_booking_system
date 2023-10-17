class CreateScreens < ActiveRecord::Migration[7.0]
  def change
    create_table :screens do |t|
      t.string :name
      t.boolean :three_d
      t.boolean :two_d

      t.timestamps
    end
  end
end
