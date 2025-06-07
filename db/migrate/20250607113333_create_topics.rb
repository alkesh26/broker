class CreateTopics < ActiveRecord::Migration[7.2]
  def change
    create_table :topics do |t|
      t.string :name, null: false, limit: 100
      t.index :name, unique: true

      t.timestamps
    end
  end
end
