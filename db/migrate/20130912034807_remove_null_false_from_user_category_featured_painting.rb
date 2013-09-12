class RemoveNullFalseFromUserCategoryFeaturedPainting < ActiveRecord::Migration
  def up
    change_column :user_categories, :featured_painting_id, :integer, null: true
  end

  def down
    change_column :user_categories, :featured_painting_id, :integer, null: false

  end
end
