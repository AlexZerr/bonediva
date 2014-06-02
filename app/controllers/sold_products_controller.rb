class SoldProductsController < ApplicationController

  def index
    @sold_products = SoldProduct.all
  end

  def create
    @sold_product = SoldProduct.new(params[:sold_product])
  end

  def show
    @sold_product = SoldProduct.find(params[:id])
  end
end
