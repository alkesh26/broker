class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.string :publisher_name, null: false, limit: 100
      t.text :content, null: false
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end

    add_index :messages, :publisher_name
  end
end
