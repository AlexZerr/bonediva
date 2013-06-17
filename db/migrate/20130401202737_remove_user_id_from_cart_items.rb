class RemoveUserIdFromCartItems < ActiveRecord::Migration
  def up
    remove_column :cart_items, :user_id
  end

  def down
    add_column :cart_items, :user_id, :integer
  end
end
