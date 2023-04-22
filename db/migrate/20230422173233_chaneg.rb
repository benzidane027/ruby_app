class Chaneg < ActiveRecord::Migration[7.0]
  def change
    change_column(:users, :is_active, :boolean)
    change_column(:users, :is_staff, :boolean)
  end
end
