class SoldProductsController < ApplicationController

  def index
    @sold_products = SoldProduct.order("id DESC").page(params[:page]).per(25)
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
end
