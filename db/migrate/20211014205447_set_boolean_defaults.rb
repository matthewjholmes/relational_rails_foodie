class SetBooleanDefaults < ActiveRecord::Migration[5.2]
  change_column :restaurants, :dine_in, :boolean, default: true
  change_column :dishes, :seasonal, :boolean, default: false
  change_column :farmers_markets, :local, :boolean, default: true
  change_column :produces, :seasonal, :boolean, default: true
end
