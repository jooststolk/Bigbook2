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

ActiveRecord::Schema.define(version: 2020_03_10_155346) do

  create_table "apartments", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bigbooks", force: :cascade do |t|
    t.string "name"
    t.string "active"
    t.string "defaultfrontpageimage"
    t.string "defaultbackpageimage"
    t.string "navigationnextimage"
    t.string "navigationpreviousimage"
    t.string "navigationgamesimage"
    t.string "navigationrestartimage"
    t.string "navigationbackfromgamesimage"
    t.string "defaultcardbacksideimage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bigimagelanguageversions", force: :cascade do |t|
    t.string "name"
    t.integer "languageversion_id"
    t.string "image"
    t.integer "bigimage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bigimage_id"], name: "index_bigimagelanguageversions_on_bigimage_id"
    t.index ["languageversion_id"], name: "index_bigimagelanguageversions_on_languageversion_id"
  end

  create_table "bigimages", force: :cascade do |t|
    t.string "name"
    t.integer "bigbook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bigbook_id"], name: "index_bigimages_on_bigbook_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "gameimages", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_gameimages_on_page_id"
  end

  create_table "gametypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inline_forms_keys", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inline_forms_locales", force: :cascade do |t|
    t.string "name"
    t.integer "inline_forms_translations_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inline_forms_translations_id"], name: "index_inline_forms_locales_on_inline_forms_translations_id"
  end

  create_table "inline_forms_translations", force: :cascade do |t|
    t.integer "inline_forms_key_id"
    t.integer "inline_forms_locale_id"
    t.text "value"
    t.text "interpolations"
    t.boolean "is_proc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inline_forms_key_id"], name: "index_inline_forms_translations_on_inline_forms_key_id"
    t.index ["inline_forms_locale_id"], name: "index_inline_forms_translations_on_inline_forms_locale_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "iso_code"
    t.string "sub_code"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languageversions", force: :cascade do |t|
    t.string "name"
    t.integer "language_id"
    t.string "title"
    t.integer "bigbook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bigbook_id"], name: "index_languageversions_on_bigbook_id"
    t.index ["language_id"], name: "index_languageversions_on_language_id"
  end

  create_table "locales", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string "name"
    t.integer "languageversion_id"
    t.integer "bigimage_id"
    t.integer "gametype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bigimage_id"], name: "index_pages_on_bigimage_id"
    t.index ["gametype_id"], name: "index_pages_on_gametype_id"
    t.index ["languageversion_id"], name: "index_pages_on_languageversion_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "name"
    t.string "caption"
    t.string "image"
    t.text "description"
    t.integer "apartment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_photos_on_apartment_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.integer "locale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", limit: 8, null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 1073741823
    t.datetime "created_at"
    t.text "object_changes", limit: 1073741823
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "words", force: :cascade do |t|
    t.string "name"
    t.string "translation"
    t.string "spoken_word"
    t.integer "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_words_on_page_id"
  end

end
