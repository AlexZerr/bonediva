class AddUserIdToCartItems < ActiveRecord::Migration
  def change
    add_column :cart_items, :user_id, :integer
  end
end
