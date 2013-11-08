class Painting < ActiveRecord::Base
  mount_uploader :image, ImagesUploader
  attr_accessible :image, :description, :title, :user_id, :remote_image_url, :id, 
    :paintable_type, :paintable_id, :home, :category_id, :primary_painting, :user_category_id,
    :aceo

 # before_create :set_polymorphism

  belongs_to :user
  belongs_to :paintable, polymorphic: true
  belongs_to :category
  belongs_to :user_category
  validates :title, presence: true

def is_home_image?(painting)
  painting.home?
end
  
  def set_polymorphism
     if [:user_category_id].present?
        self.paintable_type == "UserCategory"
        self.paintable_id == [:user_category_id]
      elsif [:category_id].present?
        self.paintable_type == "Category"
        self.paintable_id == [:category_id]
      end
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
