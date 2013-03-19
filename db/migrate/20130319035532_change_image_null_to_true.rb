class ChangeImageNullToTrue < ActiveRecord::Migration
  def up
    change_column_null :avatars, :image, true
  end

  def down
    change_column_null :avatars, :image, false
  end
end
