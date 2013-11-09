class SoldProductsController < ApplicationController

  def create
    @sold_product = SoldProduct.new(params[:sold_product])
  end
end
