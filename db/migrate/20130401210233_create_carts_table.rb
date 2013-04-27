class CreateCartsTable < ActiveRecord::Migration
  def up
    create_table :carts do |t|
      t.integer :user_id
      t.timestamp
    end
  end

  def down
    drop_table :carts
  end
end
