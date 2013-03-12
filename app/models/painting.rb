class Painting < ActiveRecord::Base
  mount_uploader :image, ImagesUploader
  attr_accessible :image, :description, :title, :user_id, :remote_image_url, :id, :paintable_type, :paintable_id, :home, :category_id

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


  
end
