class AddAceoToProducts < ActiveRecord::Migration
  def change
    add_column :products, :aceo, :boolean, default: false
  end
end
