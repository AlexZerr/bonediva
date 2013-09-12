class AddUserCategoryIdToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :user_category_id, :integer
  end
end
