class ChangeImageFormatInPictures < ActiveRecord::Migration
  def up
    change_column :pictures, :image, :text
  end

  def down
    change_column :pictures, :image, :string
  end
end
