class CreatePrints < ActiveRecord::Migration
  def up
    create_table :prints do |t|
      t.string :name
      t.string :price, null: false
      t.string :size, null: false
      t.integer :primary_painting_id
      t.integer :product_id, null: false
      t.integer :user_id, null: false
        
      t.timestamps
    end
  end

  def down
    drop_table :prints
  end
end
