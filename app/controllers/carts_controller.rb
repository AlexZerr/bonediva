class CartsController < ApplicationController
  respond_to :html, :js, :json

  def new
    
  end

  def create
    @cart = Cart.new(params[:cart])
  end

  def show
    @user = User.find(params[:user_id])
    @cart = Cart.find(params[:id])
    @cart_items = @cart.cart_items
  end

  def destroy
    respond_with @cart
  end
end
