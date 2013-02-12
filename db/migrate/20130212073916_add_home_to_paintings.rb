class AddHomeToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :home, :boolean
  end
end
