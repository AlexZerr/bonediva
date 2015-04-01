class OrdersController < ApplicationController
  

  def new
    @order = Order.new(params[:order])
  end

  def create
    @user = current_user
    @cart = @user.carts.last
    @order = @cart.build_order(params[:order])
    @order.ip_address = request.remote_ip
    @total_price = CartItem.where(cart_id: @cart.id).sum(:price)
    @order.total_price = @total_price
    if @order.save
     # if @order.purchase
      #  render action: "success"
     # else
      #  render action: "failure"
     # end
    #else
      redirect_to new_order_charge_path(order_id: @order), notice: "CHECKOUT"
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

