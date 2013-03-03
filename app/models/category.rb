class Category < ActiveRecord::Base
  
  has_many :products
  has_many :paintings, as: :paintable
  has_one :painting

  validates :name, presence: true
  

end
