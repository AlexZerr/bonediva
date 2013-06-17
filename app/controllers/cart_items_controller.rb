class CartItemsController < ApplicationController
  respond_to :html, :js, :json

  #before_filter :find_product, only: [:add_cart_item]
  before_filter :find_user, only: [:destoy]
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
    @cart_item.user_id = @user.id
    if @cart_item.save
      redirect_to :back, notice: "Painting has been added to your cart"
    else
      flash "error"
    end
  
  end

  def destroy
    @user = User.find(params[:user_id])
    @cart = @user.carts.find(params[:cart_id])
    @cart_item = @cart.cart_items.find(params[:id])
   if @cart_item.destroy
     respond_with @cart
   end

  end

  private

  def find_product
    @product = Product.find(params[:product_id])
  end

  def find_user
    @user = User.find(params[:user_id])
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
