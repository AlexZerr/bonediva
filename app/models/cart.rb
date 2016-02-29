class Cart < ActiveRecord::Base

  #validates :product_id, presence: true, uniqueness: { scope: [:cart_id] }

  has_many :cart_items
  has_many :products, through: :cart_items
  has_many :prints, through: :cart_items
  has_many :sold_products
  has_one :order
  belongs_to :user
end
