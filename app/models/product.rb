
class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price, :size, :category_id, :primary_painting_id, :aceo, :categories
  #accepts_nested_attributes_for :painting
  has_many :paintings, as: :paintable
  has_many :carts, through: :cart_items
  has_many :prints
  belongs_to :cart_item

  validates :name, presence: true
  validates :price, presence: true
  validates :size, presence: true
  #ensure_admin

  belongs_to :user
  has_and_belongs_to_many :categories


  def main_image(style)
  #  self.paintings.first.image_url(style) rescue nil
    painting = primary_painting
    painting.image_url(style)
  rescue
  end

  def primary_painting
    painting = Painting.find(primary_painting_id)
  end

    def update_product_to_sold_product
    sold_product = user.sold_products.new(
      name: name,
      description: description,
      size: size,
      price: price,
      sold_at: Time.now,
      primary_painting_id: primary_painting_id,
      categories: categories
      #product_relation_id: id,
     # order_id: order.id
    )
    if sold_product.save
      paintings.map{|e| e.update_attributes(sold_product_id: sold_product.id, paintable_type: "SoldProduct", paintable_id: sold_product.id)}
      destroy
    end
  end

    def update_to_main_image(painting)
      update_attributes(primary_painting_id: painting.id)
    end


  def remove_product_from_cart
    cart_items = CartItem.where(product_id: id)
    cart_items.map{ |e| e.destroy }
  end

end
