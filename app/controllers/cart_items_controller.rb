class CartItemsController < ApplicationController
  respond_to :html, :js, :json

  #before_filter :find_product, only: [:add_cart_item]
  before_filter :initialize_cart, only: [:create]

  def new

  end


  def create
    @product = Product.find(params[:product_id])
    @cart_item = CartItem.new(params[:cart_item])
    @cart_item.product_id = @product.id
    @cart_item.cart_id = @cart.id
    @cart_item.price = @product.price
    @cart_item.name = @product.name
    if @cart_item.save
      redirect_to products_path, notice: "Painting has been added to your cart"
    else
      flash "error"
    end
  
  end

  def destroy
    @cart = @cart.find(params[:cart_id])
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
      redirect_to current_cart_url
    end
  end

  private

  def find_product
    @product = Product.find(params[:product_id])
  end

  def initialize_cart
        @user = User.find(params[:user_id])
    if @user.carts.present?
      @cart = @user.carts.last
    else
      @cart = @user.carts.new(params[:cart])
      @cart.save
    end
  end
end 
