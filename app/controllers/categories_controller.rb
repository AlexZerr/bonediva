class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    render
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @products = Product.where( :category_id => @category.id)
    @paintings = @category.paintings
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
     redirect_to categories_path
    end
  end

  def edit
    @category = Category.find(params[:id])

  end

  def update
    @category = Category.find(params[:id])
    if @category.paintings.present?
    end
    @category.update_attributes(params[:category])
    redirect_to category_path(@category), :notice => "updated"
  end

  def delete

  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
  end
  
  #this is probly not necisary any more. in leu products should have a primary_painting_id
  #better for things to run through the update method.
  def update_featured_painting
    @painting = Painting.find(params[:painting_id])
      @cat = @painting.category
      @cat.update_attributes(featured_painting_id: @painting.id)
    if @cat.save
      redirect_to category_path(@cat)
    end
  end
end
