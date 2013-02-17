class AddFeaturedPaintingIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :featured_painting_id, :integer
  end
end
