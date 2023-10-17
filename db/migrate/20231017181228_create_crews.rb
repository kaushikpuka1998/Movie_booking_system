class CreateCrews < ActiveRecord::Migration[7.0]
  def change
    create_table :crews do |t|
      t.string :name
      t.integer :age
      t.string :image_link

      t.timestamps
    end
  end
end
