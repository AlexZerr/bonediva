class AddProductTypeToCartItems < ActiveRecord::Migration
  def change
    add_column :cart_items, :product_type, :string, null: false, default: "Original"
    add_column :cart_items, :print_id, :integer
  end
end
