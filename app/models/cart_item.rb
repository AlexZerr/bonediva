class CartItem < ActiveRecord::Base

  belongs_to :user
  belongs_to :cart
  belongs_to :product
  has_one :print
  belongs_to :order
end
