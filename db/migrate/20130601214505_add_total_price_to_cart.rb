class AddTotalPriceToCart < ActiveRecord::Migration
  def change
    add_column :carts, :total_price, :integer
  end
end
