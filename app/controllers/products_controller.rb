class ProductsController < ApplicationController

  def index
    @products = Product.all
    render
  end

  def new
    render
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      respond_with @product
    end
  end

  def edit

  end

  def update
    @product = Product.find(params[:id])
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
