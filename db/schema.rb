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

ActiveRecord::Schema.define(version: 20_160_820_214_235) do
  create_table 'credit_cards', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string   'card_number'
    t.string   'card_type'
    t.string   'name'
    t.string   'cvv'
    t.date     'expiry_date'
    t.string   'crn'
    t.integer  'environment_id', null: false
    t.string   'notes'
    t.string   'return_code'
    t.datetime 'created_at',     null: false
    t.datetime 'updated_at',     null: false
    t.index ['environment_id'], name: 'index_credit_cards_on_environment_id', using: :btree
  end

  create_table 'direct_debits', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string   'bsb'
    t.string   'account_number'
    t.integer  'environment_id', null: false
    t.string   'notes'
    t.datetime 'created_at',     null: false
    t.datetime 'updated_at',     null: false
    t.index ['environment_id'], name: 'index_direct_debits_on_environment_id', using: :btree
  end

  create_table 'environments', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string   'name',         null: false
    t.string   'url'
    t.boolean  'is_prod_data'
    t.datetime 'created_at',   null: false
    t.datetime 'updated_at',   null: false
    t.index ['name'], name: 'index_environments_on_name', unique: true, using: :btree
  end

  create_table 'paypal_accounts', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string   'user_name'
    t.string   'password'
    t.integer  'environment_id', null: false
    t.string   'notes'
    t.datetime 'created_at',     null: false
    t.datetime 'updated_at',     null: false
    t.index ['environment_id'], name: 'index_paypal_accounts_on_environment_id', using: :btree
  end

  create_table 'promos', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string   'code'
    t.string   'product'
    t.integer  'environment_id', null: false
    t.datetime 'created_at',     null: false
    t.datetime 'updated_at',     null: false
    t.index ['environment_id'], name: 'index_promos_on_environment_id', using: :btree
  end

  create_table 'sims', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string   'sim_number'
    t.string   'sim_type'
    t.integer  'environment_id', null: false
    t.string   'notes'
    t.boolean  'in_use', default: false
    t.datetime 'created_at',                     null: false
    t.datetime 'updated_at',                     null: false
    t.index ['environment_id'], name: 'index_sims_on_environment_id', using: :btree
  end

  create_table 'users', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string   'email',                  default: '',    null: false
    t.string   'encrypted_password',     default: '',    null: false
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer  'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string   'current_sign_in_ip'
    t.string   'last_sign_in_ip'
    t.datetime 'created_at',                             null: false
    t.datetime 'updated_at',                             null: false
    t.boolean  'admin', default: false
    t.index ['email'], name: 'index_users_on_email', unique: true, using: :btree
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true, using: :btree
  end

  create_table 'vouchers', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string   'code'
    t.string   'product'
    t.string   'voucher_type'
    t.date     'expiry_date'
    t.float    'value', limit: 24
    t.string   'notes'
    t.integer  'environment_id',            null: false
    t.datetime 'created_at',                null: false
    t.datetime 'updated_at',                null: false
    t.index ['environment_id'], name: 'index_vouchers_on_environment_id', using: :btree
  end

  add_foreign_key 'credit_cards', 'environments'
  add_foreign_key 'direct_debits', 'environments'
  add_foreign_key 'paypal_accounts', 'environments'
  add_foreign_key 'promos', 'environments'
  add_foreign_key 'sims', 'environments'
  add_foreign_key 'vouchers', 'environments'
end
