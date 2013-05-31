class Order < ActiveRecord::Base
  attr_accessor :card_number, :card_verification
belongs_to :cart
has_many :cart_items
end
