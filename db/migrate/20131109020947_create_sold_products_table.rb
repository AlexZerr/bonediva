class CreateSoldProductsTable < ActiveRecord::Migration
  def up
    create_table :sold_products do |t|
      t.string :name, null:false
      t.string :description
      t.float :price
      t.datetime :sold_at, null: false
      t.string :image
      t.integer :category_id
      t.integer :user_id
      t.boolean :aceo, default: false
      t.string :size
      t.integer :primary_painting_id
      t.integer :cart_id

      t.timestamps
    end
  end

  def down
    drop_table :sold_products
  end
end
