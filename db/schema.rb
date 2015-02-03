# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150202195223) do

  create_table "billings", force: true do |t|
    t.integer  "reservation_id"
    t.integer  "purchase_id"
    t.decimal  "total_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.integer  "cardnumber"
    t.string   "cardtype"
    t.date     "pay_date"
    t.date     "due_date"
    t.string   "cardname"
    t.integer  "billing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["billing_id"], name: "index_payments_on_billing_id"

  create_table "peliculas", force: true do |t|
    t.string   "tite"
    t.string   "category"
    t.integer  "length"
    t.string   "description"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prices", force: true do |t|
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", force: true do |t|
    t.string   "name"
    t.string   "lastname"
    t.integer  "ci"
    t.string   "email"
    t.integer  "elderly"
    t.string   "seat"
    t.integer  "show_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["show_id"], name: "index_purchases_on_show_id"

  create_table "reservations", force: true do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "email"
    t.integer  "ci"
    t.integer  "elderly"
    t.string   "seat"
    t.integer  "show_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reservations", ["show_id"], name: "index_reservations_on_show_id"

  create_table "rooms", force: true do |t|
    t.integer  "number"
    t.integer  "seats"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", force: true do |t|
    t.string   "hour"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seats", force: true do |t|
    t.string   "seat"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shows", force: true do |t|
    t.integer  "schedule_id"
    t.integer  "pelicula_id"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shows", ["pelicula_id"], name: "index_shows_on_pelicula_id"
  add_index "shows", ["room_id"], name: "index_shows_on_room_id"
  add_index "shows", ["schedule_id"], name: "index_shows_on_schedule_id"

  create_table "showseats", force: true do |t|
    t.integer  "show_id"
    t.integer  "seat_id"
    t.integer  "status"
    t.integer  "reservation_id"
    t.integer  "purchase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "showseats", ["purchase_id"], name: "index_showseats_on_purchase_id"
  add_index "showseats", ["reservation_id"], name: "index_showseats_on_reservation_id"
  add_index "showseats", ["seat_id"], name: "index_showseats_on_seat_id"
  add_index "showseats", ["show_id"], name: "index_showseats_on_show_id"

end
