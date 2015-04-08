class ChangeUsernameNullOnUsers < ActiveRecord::Migration
  def up
    change_column_null :users, :username, true
  end

  def down
    change_column_null :users, :username, false
  end
end
