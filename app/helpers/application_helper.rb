module ApplicationHelper

  def is_admin?
    current_user.present? && current_user.admin?
  end

  def current_user_path
    @user = current_user
    current_user_path = user_path(@user)
  end

    def update_featured_painting
    @painting = Painting.find(params[:id])
      @cat = @painting.category
      @cat.featured_painting_id = @painting.id
      @cat.save
    end

  def featured_painting
    @category = Category.find(params[:id])
    @painting = Painting.find(params[:id])
    featured_painting = @painting.where(@category.featured_painting_id = @painting.id)
  end

  def update_category
    @painting = Painting.find(params[:id])
    @product = Product.find(params[:id])
    if @painting.paintable_type = "Category"
    @painting.update_attributes(category_id: @painting.paintable_id)
    elsif @painting.paintable_type = "Product"
      @painting.update_attributes(category_id: @product.category_id)
    end
  end

  def complete_row

  end

end
