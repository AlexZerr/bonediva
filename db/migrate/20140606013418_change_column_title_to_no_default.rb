class ChangeColumnTitleToNoDefault < ActiveRecord::Migration
  def up
    change_column_default :messages, :title, nil
  end

  def down
    change_column_default :messages, :title, "no title"
  end
end
