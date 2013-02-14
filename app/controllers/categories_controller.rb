class CategoriesController < ApplicationController

  def index
    @categories = Catagory.all
    render
  end

  def new
    render
  end
  
  def create
    if is_admin?
      @category = Category.new(params[:category])
    end
  end

  def delete

  end

  def destroy

  end
end
