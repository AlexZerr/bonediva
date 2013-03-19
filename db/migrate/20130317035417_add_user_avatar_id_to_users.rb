class AddUserAvatarIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_avatar_id, :integer
  end
end
