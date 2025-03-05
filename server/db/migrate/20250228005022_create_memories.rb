class CreateMemories < ActiveRecord::Migration[7.2]
  def change
    create_table :memories do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
