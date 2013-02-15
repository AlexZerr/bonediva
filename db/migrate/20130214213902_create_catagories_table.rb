class CreateCatagoriesTable < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string :name
      t.string :description
    end
  end

  def down
    drop_table :categories
  end
end
