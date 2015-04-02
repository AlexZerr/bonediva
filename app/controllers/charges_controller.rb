class ChargesController < ApplicationController
  def new
  @order = Order.find(params[:order_id])
  @cart_items = @order.cart.cart_items
  end

  def create
    @order = Order.find(params[:order_id])
    @cart = @order.cart
    @cart_products = SoldProduct.where( product_relation_id: ( @order.cart.cart_items.map{ |e| e.product.id } ) )
    # Amount in cents
    @amount = @order.price_in_cents

    customer = Stripe::Customer.create(
      :email => @order.cart.user.email,
      :card  => params[:stripeToken]
    )

    @charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    finish_transaction

    rescue Stripe::CardError => @e
      flash[:error] = @e.message
      redirect_to charges_path(order: @order)
  end

private

  def finish_transaction
    if @charge.status == "succeeded"
      @transaction = @order.transactions.create!(
        stripe_customer_id: @charge.customer,
        stripe_charge_id: @charge.id,
        created_at: Time.now,
        success: true,
        message: "Successfull Transaction for $#{@order.total_price} Products: #{@order.cart.cart_items.map{ |e| e.product.name }}",
        action: "purchase",
        amount: @order.total_price,
      )
      @cart.cart_items.map{ |e| e.product.update_product_to_sold_product(@order) }
      @cart.cart_items.map{ |o| o.destroy }
      
    else
      @order.transactions.create!(
        success: false,
        message: "FAILED Transaction for #{@order.total_price}: #{@e.message}",
        action: "purchase",
        amount: @order.total_price
      )
    end
  end
end
