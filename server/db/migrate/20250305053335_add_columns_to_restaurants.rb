class AddColumnsToRestaurants < ActiveRecord::Migration[7.2]
  def change
    add_column :restaurants, :internal_id, :string
    add_column :restaurants, :external_id, :string
    add_column :restaurants, :payload,     :jsonb
  end
end
