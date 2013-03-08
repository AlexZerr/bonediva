class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    render
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.where( :category_id => @category.id)
    @paintings = @category.paintings
    @painting = Painting.find(params[:id])
  end

  def new
    @category = Category.new(params[:category])
  end
  
  def create
    if is_admin?
      @category = Category.new(params[:category])
    end
    if
     @category.save
     redirect_to category_path(@category)
    end
  end

  def edit

  end

  def update
    @category = Category.find(params[:id])
    @painting = @category.paintings.find(params[:id])
                                  if params[:painting][:paintable_id].present?
                                    @painting.paintable_type = "Category"
                                  end
    @painting.update
    if @category.update_attributes(params[:category])
      redirect_to category_path(@category), :notice => "updated"
    end
  end

  def delete

  end

  def destroy

  end
end
