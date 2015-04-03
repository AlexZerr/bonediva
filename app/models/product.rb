
class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price, :size, :category_id, :primary_painting_id, :aceo
  #accepts_nested_attributes_for :painting
  has_many :paintings, as: :paintable
  has_many :carts, through: :cart_items
  belongs_to :cart_item

  validates :name, presence: true
  validates :price, presence: true
  validates :size, presence: true
  #ensure_admin
  paginates_per 50
  belongs_to :user
  belongs_to :category


  def main_image(style)
    self.paintings.first.image_url(style) rescue nil
    #Painting.find(self.primary_painting_id)
  end

    def update_product_to_sold_product
    sold_product = user.sold_products.new(
      name: name,
      description: description,
      size: size,
      price: price,
      sold_at: Time.now,
      primary_painting_id: primary_painting_id,
      category_id: category_id,
      product_relation_id: id,
      order_id: order.id
    )
    if sold_product.save
      paintings.map{|e| e.update_attributes(sold_product_id: sold_product.id, paintable_type: "SoldProduct", paintable_id: sold_product.id)}
      destroy
    end
  end
end
