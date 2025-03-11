class ChangePrimaryKeyOfRestaurants < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :wishlists, :restaurants
    remove_foreign_key :memories, :restaurants

    change_column :wishlists, :restaurant_id, :string
    change_column :memories, :restaurant_id, :string

    add_index :restaurants, :internal_id, unique: true

    add_foreign_key :wishlists, :restaurants, column: :restaurant_id, primary_key: :internal_id
    add_foreign_key :memories, :restaurants, column: :restaurant_id, primary_key: :internal_id

    remove_column :restaurants, :id
    remove_column :restaurants, :name
  end
end
