class CreateFarmersMarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :farmers_markets do |t|
      t.string :name
      t.boolean :local
      t.integer :vendor_count

      t.timestamps
    end
  end
end
