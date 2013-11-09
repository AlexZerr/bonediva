class AddSoldProductIdToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :sold_product_id, :integer
  end
end
