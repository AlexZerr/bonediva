class CartsController < ApplicationController

  def new
    
  end

  def create
    @cart = Cart.new(params[:cart])
  end

  def show
    @user = User.find(params[:user_id])
    @cart = Cart.find(params[:id])
  end
end
