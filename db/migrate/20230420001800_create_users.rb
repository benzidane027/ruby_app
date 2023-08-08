class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password_digest
      t.string :picture  # add_attachment
      t.string :address
      t.string :phone
      t.string :is_active
      t.string :is_staff

      t.timestamps
    end
  end
end
