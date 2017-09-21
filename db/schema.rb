# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170921120626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"
  enable_extension "pgcrypto"

  create_table "active_admin_comments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.uuid "resource_id"
    t.string "author_type"
    t.uuid "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
  end

  create_table "events", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.date "starts_at", null: false
    t.date "ends_at", null: false
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ends_at"], name: "index_events_on_ends_at"
    t.index ["starts_at"], name: "index_events_on_starts_at"
  end

  create_table "feedback_authors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_feedback_authors_on_email"
  end

  create_table "feedback_feedbacks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "sentiment", null: false
    t.uuid "resource_id", null: false
    t.uuid "owner_id", null: false
    t.string "owner_type", null: false
    t.string "ip", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code_language"
    t.boolean "code_language_selected_whilst_on_page"
    t.boolean "code_language_set_by_url"
    t.boolean "resolved", default: false, null: false
    t.index ["code_language"], name: "index_feedback_feedbacks_on_code_language"
    t.index ["code_language_selected_whilst_on_page"], name: "index_feedbacks_on_code_language_selected_whilst_on_page"
    t.index ["code_language_set_by_url"], name: "index_feedbacks_on_code_language_set_by_url"
    t.index ["ip"], name: "index_feedback_feedbacks_on_ip"
    t.index ["owner_id", "owner_type"], name: "index_feedback_feedbacks_on_owner_id_and_owner_type"
    t.index ["resolved"], name: "index_feedback_feedbacks_on_resolved"
    t.index ["resource_id"], name: "index_feedback_feedbacks_on_resource_id"
    t.index ["sentiment"], name: "index_feedback_feedbacks_on_sentiment"
  end

  create_table "feedback_resources", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "uri", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uri"], name: "index_feedback_resources_on_uri", unique: true
  end

  create_table "sessions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "author"
    t.uuid "event_id"
    t.string "video_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
