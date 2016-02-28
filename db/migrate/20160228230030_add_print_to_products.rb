class AddPrintToProducts < ActiveRecord::Migration
  def change
    add_column :products, :print, :boolean, default: false
  end
end
