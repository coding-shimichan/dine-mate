class AddNotNullConstraintToRestaurantsExternalId < ActiveRecord::Migration[7.2]
  def change
    change_column_null :restaurants, :external_id, false
  end
end
