class OrdersController < ApplicationController


  def new
  end

  def create
    @order = Order.new(params[:order])
    @order.first_name = current_user.first_name
    @order.last_name = current_user.last_name
    if @order.save
      redirect_to order_path(@order), notice: "Confirmation"
    else
      flash "error"
    end
  end

end
