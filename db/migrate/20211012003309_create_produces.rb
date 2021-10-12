class CreateProduces < ActiveRecord::Migration[5.2]
  def change
    create_table :produces do |t|
      t.string :name
      t.boolean :seasonal
      t.integer :quantity
      t.references :farmers_market, foreign_key: true

      t.timestamps
    end
  end
end
