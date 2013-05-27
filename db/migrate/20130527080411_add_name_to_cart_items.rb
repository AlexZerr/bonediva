class AddNameToCartItems < ActiveRecord::Migration
  def change
    add_column :cart_items, :name, :string
  end
end
