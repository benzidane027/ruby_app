class RenameImageToPictureField < ActiveRecord::Migration[7.0]
  def change
    rename_column :complaints, :image, :picture
  end
end
