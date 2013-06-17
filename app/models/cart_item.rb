class CartItem < ActiveRecord::Base

  belongs_to :user
  belongs_to :cart
  has_one :product
  belongs_to :order
end
