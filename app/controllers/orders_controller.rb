class OrdersController < ApplicationController
  

  def new
    @order = Order.new(params[:order])
  end

  def create
    @user = current_user
    @cart = @user.carts.last
    @order = @cart.build_order(params[:order])
    @order.ip_address = request.remote_ip
    if @order.save
     # if@order.purchase
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

