class CreateComplaints < ActiveRecord::Migration[7.0]
  def change
    create_table :complaints do |t|
      t.string :description
      t.string :address
      t.string :comp_type
      t.string :state
      t.string :picture
      t.boolean :is_seen

      t.timestamps
    end
  end
end
