class Chaneg < ActiveRecord::Migration[7.0]
  def change
    ## for postgres
    remove_column(:users, :is_active)
    add_column(:users, :is_active, :boolean)

    remove_column(:users, :is_staff)
    add_column(:users, :is_staff, :boolean)

    ## for sqlite
    # change_column(:users, :is_active, :boolean)
    # change_column(:users, :is_staff, :boolean)
  end
end
