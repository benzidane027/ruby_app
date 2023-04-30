class RemovePictureNewField < ActiveRecord::Migration[7.0]
  def change
    remove_column :complaints, :picture
  end
end
