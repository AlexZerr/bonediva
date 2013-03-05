
class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price, :size, :category_id
  #accepts_nested_attributes_for :painting
  has_many :paintings, as: :paintable

  validates :name, presence: true
  validates :price, presence: true
  validates :size, presence: true
  #ensure_admin

  belongs_to :user
  belongs_to :category

  # def main_image
   # self.image_url \ if self.paintings.present?
  #end

  def main_image
    @product = Product.find([:id])
      @product.paintings do |p|
        main_image = p.image_url if @product.paintings.present?
      end
  end
end
