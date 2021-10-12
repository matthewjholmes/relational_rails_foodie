class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name
      t.boolean :seasonal
      t.integer :calories
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
