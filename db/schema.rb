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

ActiveRecord::Schema.define(version: 20_160_813_100_942) do
  create_table 'environments', force: :cascade do |t|
    t.string   'name',         null: false
    t.string   'url'
    t.boolean  'is_prod_data'
    t.datetime 'created_at',   null: false
    t.datetime 'updated_at',   null: false
    t.index ['name'], name: 'index_environments_on_name', unique: true
  end

  create_table 'promos', force: :cascade do |t|
    t.string   'code'
    t.string   'product'
    t.integer  'environment_id', null: false
    t.datetime 'created_at',     null: false
    t.datetime 'updated_at',     null: false
    t.index ['environment_id'], name: 'index_promos_on_environment_id'
  end

  create_table 'sims', force: :cascade do |t|
    t.string   'sim_number'
    t.string   'sim_type'
    t.integer  'environment_id', null: false
    t.string   'notes'
    t.boolean  'in_use'
    t.datetime 'created_at',     null: false
    t.datetime 'updated_at',     null: false
    t.index ['environment_id'], name: 'index_sims_on_environment_id'
  end

  create_table 'vouchers', force: :cascade do |t|
    t.string   'code'
    t.string   'product'
    t.string   'voucher_type'
    t.date     'expiry_date'
    t.float    'value'
    t.string   'notes'
    t.integer  'environment_id', null: false
    t.datetime 'created_at',     null: false
    t.datetime 'updated_at',     null: false
    t.index ['environment_id'], name: 'index_vouchers_on_environment_id'
  end
end