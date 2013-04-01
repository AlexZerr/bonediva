class Cart < ActiveRecord::Base

  has_many :cart_items
  belongs_to :user
end
