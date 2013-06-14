class CreatOrderTransactionsTable < ActiveRecord::Migration
  def up
    create_table :order_transactions do |t|
      t.integer :order_id, null: false
      t.string :action
      t.integer :amount
      t.boolean :success
      t.string :authorization
      t.string :message
      t.text :params

      t.timestamps
    end
  end

  def down
    drop_table :order_transactions
  end
end
