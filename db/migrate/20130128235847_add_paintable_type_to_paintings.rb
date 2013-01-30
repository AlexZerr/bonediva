class AddPaintableTypeToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :paintable_type, :string, limit: 50
    add_column :paintings, :paintable_id, :integer
  end
end
