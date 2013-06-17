class CreateOrderTable < ActiveRecord::Migration
  def up
    create_table :orders do |t|
      t.integer :cart_id, required: true
      t.string :ip_address
      t.string :first_name
      t.string :last_name
      t.string :card_type
      t.date :card_expires_on

      t.timestamps
    end
  end

  def down
    drop_table :orders
  end
end
