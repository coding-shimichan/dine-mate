class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chat, null: false, foreign_key: true
      t.text :content, null: false
      t.boolean :is_read, default: false

      t.timestamps
    end
  end
end
