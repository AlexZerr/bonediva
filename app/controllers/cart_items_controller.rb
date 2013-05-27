class CartItemsController < ApplicationController

  #before_filter :find_product, only: [:add_cart_item]
  before_filter :initialize_cart, only: [:add_cart_item]


  def add_cart_item(product)
    @cart_item = CartItem.new(params[:cart_item])
    @cart_item.product_id = product.id
    @cart_item.cart_id = @cart.id
    @cart_item.price = product.price
    if @cart_item.save
      redirect_to products_path, notice: "Painting has been added to your cart"
    else
      flash "error"
    end
  
  end


  private

  def find_product
    @product = Product.find(params[:product_id])
  end

  def initialize_cart
        @user = User.find(params[:user_id])
    if @user.carts.present?
      @cart = @user.carts
    else
      @cart = @user.carts.new(params[:cart])
    end
    @cart.save
  end
end 
