class ChangeCardTypeToBrandOnOrders < ActiveRecord::Migration
  def up
    change_table :orders do |c|
      c.rename :card_type, :brand
    end
  end

  def down
    change_table :orders do |c|
      c.rename :brand, :card_type
    end
  end
end
