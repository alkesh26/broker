class CreateSubscriptions < ActiveRecord::Migration[7.2]
  def change
    create_table :subscriptions do |t|
      t.references :subscriber, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end

    add_index :subscriptions, [ :subscriber_id, :topic_id ], unique: true
  end
end
