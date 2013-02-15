class CategoriesController < ApplicationController

  def index
    @categories = Catagory.all
    
    render
  end

  def show
    @category = Category.find(params[:id])
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
