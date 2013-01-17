class RemoveDiscriptionFromPaintings < ActiveRecord::Migration
  def up
    remove_column :paintings, :discription
  end

  def down
    add_column :paintings, :discription, :text
  end
end
