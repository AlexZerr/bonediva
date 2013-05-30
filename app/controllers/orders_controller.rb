class OrdersController < ApplicationController


  def new
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      redirect_to user_cart_order_path(current_user,current_user.carts.last, @order), notice: "CHECKOUT"
    else
      flash "error"
    end
  end

  def show
    @order = Order.find(params[:id])
    @user = User.find(params[:user_id])
    @cart = Cart.find(params[:cart_id])
    @cart_items = @cart.cart_items
    @price = CartItem.where(cart_id: @cart.id).sum(:price)
  end

end
