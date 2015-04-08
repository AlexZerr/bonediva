class SoldProduct < ActiveRecord::Base
 attr_accessible :name, :description, :price, :sold_at, :image, :category_id, 
                  :primary_painting_id, :size

 belongs_to :user
 belongs_to :category
 has_many :paintings, as: :paintable 


   def main_image(style)
    #self.paintings.first.image_url(style) rescue nil
    painting = Painting.find(primary_painting_id)
    painting.image_url(style)
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
