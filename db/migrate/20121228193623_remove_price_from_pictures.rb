class RemovePriceFromPictures < ActiveRecord::Migration
  def up
    remove_column :pictures, :price
  end

  def down
    add_column :pictures, :price, :integer
  end
end
