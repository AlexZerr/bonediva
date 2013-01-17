class RemoveImageFromPictures < ActiveRecord::Migration
  def up
    remove_column :pictures, :image
  end

  def down
    add_column :pictures, :image, :text
  end
end
