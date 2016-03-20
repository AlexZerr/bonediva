class PrintCategory < ActiveRecord::Base
  attr_accessible :print_type, :size, :price, :description
  has_many :prints
  belongs_to :product

end
