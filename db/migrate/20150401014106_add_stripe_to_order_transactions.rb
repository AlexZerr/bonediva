class AddStripeToOrderTransactions < ActiveRecord::Migration
  def change
    add_column :order_transactions, :stripe_customer_id, :string
    add_column :order_transactions, :stripe_charge_id, :string
  end
end
