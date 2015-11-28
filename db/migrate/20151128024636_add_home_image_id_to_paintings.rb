class AddHomeImageIdToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :home_image_id, :integer
  end
end
