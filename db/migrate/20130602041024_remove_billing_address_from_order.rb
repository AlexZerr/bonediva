class RemoveBillingAddressFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :billing_address
  end

  def down
    add_column :orders, :billing_address, :string
  end
end
