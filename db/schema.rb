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

ActiveRecord::Schema.define(version: 20171204162248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abordages", force: :cascade do |t|
    t.bigint "tresor_id"
    t.bigint "pirate_id"
    t.text "message"
    t.bigint "type_abordage_id"
    t.boolean "accepte"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pirate_id"], name: "index_abordages_on_pirate_id"
    t.index ["tresor_id"], name: "index_abordages_on_tresor_id"
    t.index ["type_abordage_id"], name: "index_abordages_on_type_abordage_id"
  end

  create_table "crew_pirates", force: :cascade do |t|
    t.bigint "crew_id"
    t.bigint "pirate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crew_id"], name: "index_crew_pirates_on_crew_id"
    t.index ["pirate_id"], name: "index_crew_pirates_on_pirate_id"
  end

  create_table "crew_tresors", force: :cascade do |t|
    t.bigint "tresor_id"
    t.bigint "crew_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crew_id"], name: "index_crew_tresors_on_crew_id"
    t.index ["tresor_id"], name: "index_crew_tresors_on_tresor_id"
  end

  create_table "crews", force: :cascade do |t|
    t.string "nom"
    t.boolean "prive"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pirates", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_pirates_on_email", unique: true
    t.index ["reset_password_token"], name: "index_pirates_on_reset_password_token", unique: true
  end

  create_table "tresors", force: :cascade do |t|
    t.string "titre"
    t.string "photo"
    t.text "description"
    t.boolean "prive"
    t.string "indice"
    t.bigint "pirate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pirate_id"], name: "index_tresors_on_pirate_id"
  end

  create_table "type_abordages", force: :cascade do |t|
    t.string "nom"
    t.string "emoji"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "abordages", "pirates"
  add_foreign_key "abordages", "tresors"
  add_foreign_key "abordages", "type_abordages"
  add_foreign_key "crew_pirates", "crews"
  add_foreign_key "crew_pirates", "pirates"
  add_foreign_key "crew_tresors", "crews"
  add_foreign_key "crew_tresors", "tresors"
  add_foreign_key "tresors", "pirates"
end
