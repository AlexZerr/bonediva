class Print < ActiveRecord::Base
  attr_accessible :name, :price, :size, :primary_painting_id

  belongs_to :product
  belongs_to :user
end
