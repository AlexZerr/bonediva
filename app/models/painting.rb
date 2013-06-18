class Painting < ActiveRecord::Base
  mount_uploader :image, ImagesUploader
  attr_accessible :image, :description, :title, :user_id, :remote_image_url, :id, 
    :paintable_type, :paintable_id, :home, :category_id, :primary_painting

  belongs_to :user
  belongs_to :paintable, polymorphic: true
  belongs_to :category
  validates :title, presence: true

def is_home_image?(painting)
  painting.home?
end
  
  def update_category
    if self.paintable_type = "Category"
    self.update_attributes(category_id: self.paintable_id)
    else
      @product = Product.find[:id]
    self.update_attributes(category_id: @product.id )
    end
  end

  def remove_primary_painting_from_product
    Product.where(primary_painting_id: self.id).update_all(primary_painting_id: nil)
  end


  
end
