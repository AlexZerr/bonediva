class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @category = Category.find(:featured_painting_id)
    #@featured_painting = Painting.find[:featured_painting_id]
    
    render
  end

  def show
    #@product = Product.find(params[:id])
    @category = Category.find(params[:id])
    #@products = Product.where( @product.category_id == @category.id ).limit(20)
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

  def delete

  end

  def destroy

  end
end
