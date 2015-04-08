class AddProductAndCartIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :product_ids, :text
  end
end
