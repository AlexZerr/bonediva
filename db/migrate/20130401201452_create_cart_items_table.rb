class CreateCartItemsTable < ActiveRecord::Migration
  def up
    create_table :cart_items do |t|
      t.integer :product_id, null: false
      t.integer :user_id,    null:false
      t.timestamp
    end
  end

  def down
    drop_table :cart_items
  end
end
