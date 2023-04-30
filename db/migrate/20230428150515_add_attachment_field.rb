class AddAttachmentField < ActiveRecord::Migration[7.0]
  def change
    add_column :complaints , :image  ,:attachment
  end
end
