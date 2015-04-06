class ChangeDescriptionOnSoldProducts < ActiveRecord::Migration
  def up
    change_column :sold_products, :description, :text
  end

  def down
    change_column :sold_products, :description, :string
  end
end
