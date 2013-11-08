class AddAceoToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :aceo, :boolean, default: false
  end
end
