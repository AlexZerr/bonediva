class Category < ActiveRecord::Base
  
  has_many :products
  has_many :paintings, as: :paintable
  belongs_to :featured_painting, class_name: "Painting", foreign_key: :featured_painting_id

  validates :name, presence: true
  

  def update_featured_painting
    @painting = Painting.find(params[:id])
      @painting.category.update_attributes(featured_painting_id: @painting.id)
      @painting.save
  end

end
