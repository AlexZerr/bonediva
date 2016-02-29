class AddPrintCategories < ActiveRecord::Migration
  def up
    create_table :print_categories do |t|
      t.string :name, null: false
      t.text :description

        t.timestamps
    end
    add_column :prints, :print_category_id, :integer
  end

  def down
    drop_table :print_categories
    remove_column :prints, :print_category_id
  end
end
