class Print < ActiveRecord::Base
  attr_accessible :name, :price, :size, :primary_painting_id, :user_id

  belongs_to :product
  belongs_to :user
  belongs_to :cart_item
  has_many :carts, through: :cart_items

  def primary_painting
    painting = Painting.find(primary_painting_id)
  end

end
