class AddProductRelationIdToSoldProducts < ActiveRecord::Migration
  def change
    add_column :sold_products, :product_relation_id, :integer
    add_column :sold_products, :order_id, :integer
  end
end
