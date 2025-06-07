# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_06_07_113346) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.string "publisher_name", limit: 100, null: false
    t.text "content", null: false
    t.bigint "topic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publisher_name"], name: "index_messages_on_publisher_name"
    t.index ["topic_id"], name: "index_messages_on_topic_id"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_subscribers_on_name", unique: true
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "subscriber_id", null: false
    t.bigint "topic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscriber_id", "topic_id"], name: "index_subscriptions_on_subscriber_id_and_topic_id", unique: true
    t.index ["subscriber_id"], name: "index_subscriptions_on_subscriber_id"
    t.index ["topic_id"], name: "index_subscriptions_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_topics_on_name", unique: true
  end

  add_foreign_key "messages", "topics"
  add_foreign_key "subscriptions", "subscribers"
  add_foreign_key "subscriptions", "topics"
end
