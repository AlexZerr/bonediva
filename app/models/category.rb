class Category < ActiveRecord::Base
  
  has_many :products
  has_many :paintings, as: :paintable
  has_many :sold_products
  belongs_to :featured_painting, class_name: "Painting", foreign_key: :featured_painting_id

  validates :name, presence: true
  

end
