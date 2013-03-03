class ChangePaintingIdToFeaturedPaintingId < ActiveRecord::Migration
  def up
    rename_column :categories, :painting_id, :featured_painting_id
  end

  def down
    rename_column :categories, :featured_painting_id, :painting_id
  end
end
