class CreateCategoriesSoldProductsJoinTable < ActiveRecord::Migration
  def change
    create_table :categories_sold_products, id: false do |t|
      t.integer :category_id
      t.integer :sold_product_id
    end
    add_index :categories_sold_products, [:category_id, :sold_product_id], name: "SoldProductCategoryIndex"
  end
end
