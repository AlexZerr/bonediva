class AddPrintToProducts < ActiveRecord::Migration
  def change
    add_column :products, :print, :boolean, default: false
    add_column :products, :print_price, :string
    add_column :products, :print_size, :string
  end
end
