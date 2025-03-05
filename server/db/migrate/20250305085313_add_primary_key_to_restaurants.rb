class AddPrimaryKeyToRestaurants < ActiveRecord::Migration[7.2]
  def change
    execute "ALTER TABLE restaurants ADD PRIMARY KEY (internal_id);"
  end
end
