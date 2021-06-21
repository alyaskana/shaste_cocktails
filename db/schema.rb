# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_21_213223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "cocktails", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title"
    t.string "image"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "directions", default: [], array: true
    t.string "youtube"
    t.index ["user_id"], name: "index_cocktails_on_user_id"
  end

  create_table "cocktails_ingredients", force: :cascade do |t|
    t.integer "cocktail_id", null: false
    t.integer "ingredient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "amount"
    t.index ["cocktail_id"], name: "index_cocktails_ingredients_on_cocktail_id"
    t.index ["ingredient_id"], name: "index_cocktails_ingredients_on_ingredient_id"
  end

  create_table "cocktails_likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "cocktail_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cocktail_id"], name: "index_cocktails_likes_on_cocktail_id"
    t.index ["user_id"], name: "index_cocktails_likes_on_user_id"
  end

  create_table "cocktails_tags", force: :cascade do |t|
    t.integer "cocktail_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cocktail_id"], name: "index_cocktails_tags_on_cocktail_id"
    t.index ["tag_id"], name: "index_cocktails_tags_on_tag_id"
  end

  create_table "favorited_cocktails", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "cocktail_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cocktail_id"], name: "index_favorited_cocktails_on_cocktail_id"
    t.index ["user_id"], name: "index_favorited_cocktails_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "following_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follower_id"], name: "index_follows_on_follower_id"
    t.index ["following_id"], name: "index_follows_on_following_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "parent_id"
    t.string "image"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "posts_cocktails", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "cocktail_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cocktail_id"], name: "index_posts_cocktails_on_cocktail_id"
    t.index ["post_id"], name: "index_posts_cocktails_on_post_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tag_type"
  end

  create_table "tasted_cocktails", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "cocktail_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cocktail_id"], name: "index_tasted_cocktails_on_cocktail_id"
    t.index ["user_id"], name: "index_tasted_cocktails_on_user_id"
  end

  create_table "user_ingredients", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "ingredient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_id"], name: "index_user_ingredients_on_ingredient_id"
    t.index ["user_id"], name: "index_user_ingredients_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "user_name"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.text "description"
    t.string "link"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cocktails", "users"
  add_foreign_key "cocktails_ingredients", "cocktails"
  add_foreign_key "cocktails_ingredients", "ingredients"
  add_foreign_key "cocktails_likes", "cocktails"
  add_foreign_key "cocktails_likes", "users"
  add_foreign_key "cocktails_tags", "cocktails"
  add_foreign_key "cocktails_tags", "tags"
  add_foreign_key "favorited_cocktails", "cocktails"
  add_foreign_key "favorited_cocktails", "users"
  add_foreign_key "follows", "users", column: "follower_id"
  add_foreign_key "follows", "users", column: "following_id"
  add_foreign_key "posts", "users"
  add_foreign_key "posts_cocktails", "cocktails"
  add_foreign_key "posts_cocktails", "posts"
  add_foreign_key "tasted_cocktails", "cocktails"
  add_foreign_key "tasted_cocktails", "users"
  add_foreign_key "user_ingredients", "ingredients"
  add_foreign_key "user_ingredients", "users"
end
