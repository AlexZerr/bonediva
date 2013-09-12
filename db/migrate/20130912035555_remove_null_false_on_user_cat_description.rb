class RemoveNullFalseOnUserCatDescription < ActiveRecord::Migration
  def up
    change_column :user_categories, :description, :string, null: true
  end

  def down
    change_column :user_categories, :description, :string, null: false
  end
end
