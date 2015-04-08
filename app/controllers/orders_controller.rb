class OrdersController < ApplicationController
  
  def index
    @orders = current_user.orders.all
  end

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
    @order.cart_id = @cart.id
    products = @cart.cart_items.map{ |e| e.product }
    @order.product_ids = products.map{ |e| e.id }
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
    @user = current_user
    @cart = @order.cart
    @cart_products = SoldProduct.where( product_relation_id: ( @order.product_ids ) )
  end

end

