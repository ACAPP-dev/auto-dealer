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

ActiveRecord::Schema.define(version: 2020_04_02_172208) do

  create_table "appointments", force: :cascade do |t|
    t.string "type"
    t.string "description"
    t.string "date"
    t.string "time"
    t.integer "customer_id"
    t.integer "employee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "carnames", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "features"
    t.integer "make_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.string "type"
    t.integer "access_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "makes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "description"
    t.string "link_to_photo"
    t.integer "vehicle_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vehicle_sales", force: :cascade do |t|
    t.float "cost"
    t.float "price"
    t.string "date"
    t.integer "customer_id"
    t.integer "employee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "make_id"
    t.integer "carname_id"
    t.integer "year"
    t.integer "price"
    t.integer "doors"
    t.string "body_style"
    t.string "vin"
    t.string "transmission"
    t.string "description"
    t.string "drivetrain"
    t.string "fuel_type"
    t.integer "mileage"
    t.string "ext_color"
    t.string "int_color"
    t.integer "mileage_city"
    t.integer "mileage_hwy"
    t.string "type"
    t.string "options"
    t.boolean "sold", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
