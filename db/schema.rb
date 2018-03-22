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

ActiveRecord::Schema.define(version: 20180322113551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "title"
    t.string "purpose"
    t.boolean "estimated_duration"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "discussion_id"
    t.bigint "comment_id"
    t.index ["comment_id"], name: "index_campaigns_on_comment_id"
    t.index ["discussion_id"], name: "index_campaigns_on_discussion_id"
    t.index ["user_id", "created_at"], name: "index_campaigns_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "title"
    t.bigint "discussion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "campaign_id"
    t.index ["campaign_id"], name: "index_comments_on_campaign_id"
    t.index ["discussion_id"], name: "index_comments_on_discussion_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "comments_campaigns", force: :cascade do |t|
    t.text "title"
    t.bigint "campaign_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_comments_campaigns_on_campaign_id"
    t.index ["user_id"], name: "index_comments_campaigns_on_user_id"
  end

  create_table "discussions", force: :cascade do |t|
    t.text "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_discussions_on_user_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_taggings_on_campaign_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "expert", default: false
    t.bigint "comment_id"
    t.index ["comment_id"], name: "index_users_on_comment_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "campaigns", "comments"
  add_foreign_key "campaigns", "discussions"
  add_foreign_key "campaigns", "users"
  add_foreign_key "comments", "campaigns"
  add_foreign_key "comments", "discussions"
  add_foreign_key "comments", "users"
  add_foreign_key "comments_campaigns", "campaigns"
  add_foreign_key "comments_campaigns", "users"
  add_foreign_key "discussions", "users"
  add_foreign_key "taggings", "campaigns"
  add_foreign_key "taggings", "tags"
  add_foreign_key "users", "comments"
end
