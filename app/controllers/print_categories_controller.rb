class PrintCategoriesController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @print_category = @product.print_categories.new
    @print_type = ["Giclee", "Photo"]
  end

  def create
    @product = Product.find(params[:product_id])
    @print_category = @product.print_categories.new(params[:print_category])
    @print_category.print_type = params[:print_type]
    binding.pry
    if @print_category.save
      redirect_to :back, notice: "A #{@print_category.print_type} Version Of This Painting Has Been Created"
    end
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

