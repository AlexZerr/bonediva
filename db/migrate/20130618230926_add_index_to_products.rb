class AddIndexToProducts < ActiveRecord::Migration
  def change
    add_index :products, :name
    add_index :products, :description
    add_index :products, :id
  end
end
