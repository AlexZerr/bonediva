class AddPrimaryPaintingIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :primary_painting_id, :integer
  end
end
