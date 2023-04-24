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

ActiveRecord::Schema[7.0].define(version: 20_230_424_012_546) do
  create_table 'active_refres_tokens', force: :cascade do |t|
    t.string 'token'
    t.string 'user_id'
    t.string 'device_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'complaints', force: :cascade do |t|
    t.string 'description'
    t.string 'address'
    t.string 'comp_type'
    t.string 'state'
    t.string 'picture'
    t.boolean 'is_seen'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
    t.index ['user_id'], name: 'index_complaints_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'fname'
    t.string 'lname'
    t.string 'email'
    t.string 'password_digest'
    t.string 'picture'
    t.string 'address'
    t.string 'phone'
    t.boolean 'is_active'
    t.boolean 'is_staff'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
