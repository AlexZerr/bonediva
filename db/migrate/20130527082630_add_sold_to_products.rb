class AddSoldToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sold, :boolean, default: false
  end
end
