class AddPurchaseInfoToPrintCategories < ActiveRecord::Migration
  def change
    add_column :print_categories, :price, :string, null: :false
    rename_column :print_categories, :name, :type
    add_column :print_categories, :giclee, :boolean, default: false
    add_column :print_categories, :photo, :boolean, default: false
    add_column :print_categories, :product_id, :integer, null: false
  end
end
