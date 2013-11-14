class SoldProduct < ActiveRecord::Base
 attr_accessible :name, :description, :price, :sold_at, :image, :category_id

 belongs_to :user
 belongs_to :category
 has_many :paintings, as: :paintable 


   def main_image(style)
    self.paintings.first.image_url(style) rescue nil
    #Painting.find(self.primary_painting_id)
  end
end
