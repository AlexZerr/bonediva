class CreateTableProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, null: false
      t.string :size, null: false
      t.integer :user_id
      t.references :category
    end
  end

  def down
    drop_table :products
  end
end
