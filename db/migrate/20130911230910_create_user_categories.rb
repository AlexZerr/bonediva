class CreateUserCategories < ActiveRecord::Migration
  def up
    create_table :user_categories do |t|
      t.string :name, limit: 100, null: false
      t.string :description, limit: 150, null:false
      t.integer :user_id, null: false
      t.integer :featured_painting_id, null: false

      t.timestamps
    end
  end

  def down
    drop_table :user_categories
  end
end
