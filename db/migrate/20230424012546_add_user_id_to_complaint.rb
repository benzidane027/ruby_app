class AddUserIdToComplaint < ActiveRecord::Migration[7.0]
  def change
    add_column :complaints, :user_id, :integer
    add_index :complaints, :user_id
  end
end
