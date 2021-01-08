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

ActiveRecord::Schema.define(version: 2021_01_03_221713) do

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
    t.text "directions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_cocktails_on_user_id"
  end

  create_table "cocktails_ingredients", force: :cascade do |t|
    t.integer "cocktail_id", null: false
    t.integer "ingredient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cocktail_id"], name: "index_cocktails_ingredients_on_cocktail_id"
    t.index ["ingredient_id"], name: "index_cocktails_ingredients_on_ingredient_id"
  end

  create_table "cocktails_tastes", force: :cascade do |t|
    t.integer "cocktail_id", null: false
    t.integer "taste_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cocktail_id"], name: "index_cocktails_tastes_on_cocktail_id"
    t.index ["taste_id"], name: "index_cocktails_tastes_on_taste_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "cocktail_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cocktail_id"], name: "index_favorites_on_cocktail_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "followers", force: :cascade do |t|
    t.integer "follower_id_id", null: false
    t.integer "following_id_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follower_id_id"], name: "index_followers_on_follower_id_id"
    t.index ["following_id_id"], name: "index_followers_on_following_id_id"
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
    t.bigint "parent_id"
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

  create_table "tasted_cocktails", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "cocktail_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cocktail_id"], name: "index_tasted_cocktails_on_cocktail_id"
    t.index ["user_id"], name: "index_tasted_cocktails_on_user_id"
  end

  create_table "tastes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.string "first_name"
    t.string "last_name"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "want_to_try_cocktails", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "cocktail_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cocktail_id"], name: "index_want_to_try_cocktails_on_cocktail_id"
    t.index ["user_id"], name: "index_want_to_try_cocktails_on_user_id"
  end

  add_foreign_key "cocktails", "users"
  add_foreign_key "cocktails_ingredients", "cocktails"
  add_foreign_key "cocktails_ingredients", "ingredients"
  add_foreign_key "cocktails_tastes", "cocktails"
  add_foreign_key "cocktails_tastes", "tastes"
  add_foreign_key "favorites", "cocktails"
  add_foreign_key "favorites", "users"
  add_foreign_key "followers", "follower_ids"
  add_foreign_key "followers", "following_ids"
  add_foreign_key "posts", "users"
  add_foreign_key "posts_cocktails", "cocktails"
  add_foreign_key "posts_cocktails", "posts"
  add_foreign_key "tasted_cocktails", "cocktails"
  add_foreign_key "tasted_cocktails", "users"
  add_foreign_key "user_ingredients", "ingredients"
  add_foreign_key "user_ingredients", "users"
  add_foreign_key "want_to_try_cocktails", "cocktails"
  add_foreign_key "want_to_try_cocktails", "users"
end
