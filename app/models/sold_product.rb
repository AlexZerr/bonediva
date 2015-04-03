class SoldProduct < ActiveRecord::Base
  paginates_per 25
 attr_accessible :name, :description, :price, :sold_at, :image, :category_id, :size,
                 :user_id, :primary_painting_id, :product_relation_id, :order_id

 belongs_to :user
 belongs_to :category
 belongs_to :order
 has_many :paintings, as: :paintable 


   def main_image(style)
    self.paintings.first.image_url(style) rescue nil
    #Painting.find(self.primary_painting_id)
  end

  def update_sold_product_to_product
    product = user.products.new(
      name: name,
      description: description,
      size: size,
      price: price,
      primary_painting_id: primary_painting_id,
      category_id: category_id
      #product_relation_id: id,
   # order_id: order.id
    )
    if product.save
      paintings.map{|e| e.update_attributes(sold_product_id: nil, paintable_type: "Product", paintable_id: product.id)}
      destroy
    end
  end


end
