class OrdersController < ApplicationController


  def new
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      redirect_to user_cart_order_path(current_user,current_user.carts.last, @order), notice: "Confirmation"
    else
      flash "error"
    end
  end

  def show
    @user = User.find(params[:user_id])
    @cart = @user.carts.last
    @cart_items = @cart.cart_items
    @price = CartItem.where(cart_id: @cart.id).sum(:price)
  end

end
