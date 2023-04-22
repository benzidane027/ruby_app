ActiveRecord::Schema[7.0].define(version: 20_230_422_173_233) do
  create_table 'active_refres_tokens', force: :cascade do |t|
    t.string 'token'
    t.string 'user_id'
    t.string 'device_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
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
