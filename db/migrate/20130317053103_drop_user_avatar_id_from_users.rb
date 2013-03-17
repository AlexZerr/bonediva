class DropUserAvatarIdFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :user_avatar_id
  end

  def down
    add_column :users, :user_avatar_id, :integer
  end
end
