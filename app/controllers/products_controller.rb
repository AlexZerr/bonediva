class ProductsController < ApplicationController

  def index
    @products = Product.all
    render
  end
  
  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = current_user.products.new(params[:product])
    @painting = @product.painting
    render
  end

  def create
    @product = current_user.products.new(params[:product])
     if@product.save
       redirect_to product_path(@product)
     end
  end

  def edit

  end

  def update
    @product = Product.find(params[:id])
    @painting = @product.paintings
    if params[:painting][:paintable_id].present?
      @painting.paintable_type = "Product"
    end
      @painting.update
    if @product.update_attributes(params[:product])
      redirect_to product_path(@product), :notice => "your painting has been updated"
    end
  end

  def delete

  end

  def destroy
    @product = Product.find(params[:id])
     @product.destoy
  end
end
