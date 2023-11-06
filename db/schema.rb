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

ActiveRecord::Schema[7.0].define(version: 2023_11_06_123119) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "cep"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insses", force: :cascade do |t|
    t.float "aliquot", null: false
    t.float "from", null: false
    t.float "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string "number"
    t.string "reference"
    t.bigint "proponent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proponent_id"], name: "index_phones_on_proponent_id"
  end

  create_table "proponents", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.bigint "address_id", null: false
    t.date "birth_date"
    t.decimal "salary", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "inss_dedution"
    t.float "inss_aliquot"
    t.float "inss_liquid_salary"
    t.index ["address_id"], name: "index_proponents_on_address_id"
  end

  add_foreign_key "phones", "proponents"
  add_foreign_key "proponents", "addresses"
end
