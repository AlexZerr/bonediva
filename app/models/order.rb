class Order < ActiveRecord::Base
  attr_accessor :card_number, :card_verification
belongs_to :cart
has_many :cart_items


  def price_in_cents
    (self.total_price*100).round
  end

  private

end
