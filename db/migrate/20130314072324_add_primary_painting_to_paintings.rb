class AddPrimaryPaintingToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :primary_painting, :boolean, default: false
  end
end
