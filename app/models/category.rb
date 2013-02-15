class Category < ActiveRecord::Base
  
  has_many :products
  has_one :painting

  validates :name, presence: true
  

end
