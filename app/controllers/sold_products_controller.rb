class SoldProductsController < ApplicationController

  def index
    @sold_products = SoldProduct.order("id DESC").page(params[:page]).per(15)
  end

  def create
    @sold_product = SoldProduct.new(params[:sold_product])
    if @sold_product.save
      redirect_to :root, notice: "Updated to Sold"
    else
      redirect_to :back, notice: "#{@sold_product.errors.full_messages}"
    end
  end

  def show
    @sold_product = SoldProduct.find(params[:id])
  end

  def revert_to_product
    @sold_product = SoldProduct.find(params[:sold_product_id])
    if @sold_product.update_sold_product_to_product
      redirect_to :root, notice: "#{@sold_product.name} has been reverted back to a product."
    else
      redirect_to :back, notice: "#{@sold_product.errors.full_messages}"
    end
  end

end
