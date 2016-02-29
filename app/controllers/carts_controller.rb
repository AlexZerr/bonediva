class CartsController < ApplicationController
  respond_to :html, :js, :json

  before_filter :find_user, only: [:destoy]
  before_filter :cart_total_price, only: [:show, :create, :update]

  def new
    
  end

  def create
    @cart = Cart.new(params[:cart])
  end

  def show
    @cart_items = @cart.cart_items
    @products 
  end

  def update
    if @cart.order.new?
      @cart.total_price = @total_price
    end
  end

  def destroy
    respond_with @cart
  end

  private

  def cart_total_price
    @cart = Cart.find(params[:id])
    @total_price = CartItem.where(cart_id: @cart.id).sum(:price)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
