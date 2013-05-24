class CartsController < ApplicationController

  def new
    
  end

  def create
    @cart = Cart.new(params[:cart])
  end

  def show
    @cart = Cart.find(params[:id])
  end
end
