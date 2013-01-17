class AddTimestampsToPaintings < ActiveRecord::Migration
  def up
    change_table :paintings do |t|
      t.integer :user_id
      t.timestamps
    end
  end

  def down
    remove_column :paintings, :user_id
    remove_column :timestamps
  end
end
