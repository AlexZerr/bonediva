class PrintCategoriesController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @print_category = @product.print_categories.new
    @print_type = ["Gicle", "Photo"]
  end

  def create
    @print_category = PrintCategory.new(params[:print_category])
    @print_category.save

  end

  def show
    @print_category = PrintCategory.find(params[:id])
  end

  def edit
    @print = Print.new
  end

  def update

  end

end

