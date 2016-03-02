class PrintCategory < ActiveRecord::Base

  has_many :prints
  belongs_to :product

end
