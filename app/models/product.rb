
class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price, :size, :category_id, :primary_painting_id
  #accepts_nested_attributes_for :painting
  has_many :paintings, as: :paintable
  has_many :carts, through: :cart_items
  has_many :cart_items

  validates :name, presence: true
  validates :price, presence: true
  validates :size, presence: true
  #ensure_admin

  belongs_to :user
  belongs_to :category

  # def main_image
   # self.image_url \ if self.paintings.present?
  #end

  def main_image(style)
    self.paintings.first.image_url(style) rescue nil
    #Painting.find(self.primary_painting_id)
  end
end
