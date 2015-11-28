class ChangeColumnImageOnPainting < ActiveRecord::Migration
  def up
    change_column :paintings, :image, :text
  end

  def down
    change_column :paintings, :image, :string
  end
end
