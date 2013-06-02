class AddBillingAddressToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :billing_address, :string
  end
end
