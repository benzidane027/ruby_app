class CreateActiveRefresTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :active_refres_tokens do |t|
      t.string :token
      t.string :user_id
      t.string :device_id

      t.timestamps
    end
  end
end
