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

ActiveRecord::Schema[8.0].define(version: 2025_04_09_231451) do
  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comment_replies", force: :cascade do |t|
    t.integer "comment_id", null: false
    t.string "comment_reply_text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_replies_on_comment_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "journal_id", null: false
    t.string "comment_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["journal_id"], name: "index_comments_on_journal_id"
  end

  create_table "journal_tag_relationships", force: :cascade do |t|
    t.integer "tag_id", null: false
    t.integer "journal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["journal_id"], name: "index_journal_tag_relationships_on_journal_id"
    t.index ["tag_id"], name: "index_journal_tag_relationships_on_tag_id"
  end

  create_table "journals", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title"
    t.string "entry"
    t.integer "category_id", null: false
    t.boolean "private"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_journals_on_category_id"
    t.index ["user_id"], name: "index_journals_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.string "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "comment_replies", "comments"
  add_foreign_key "comments", "journals"
  add_foreign_key "journal_tag_relationships", "journals"
  add_foreign_key "journal_tag_relationships", "tags"
  add_foreign_key "journals", "categories"
  add_foreign_key "journals", "users"
end
