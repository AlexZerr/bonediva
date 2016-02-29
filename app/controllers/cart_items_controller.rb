class CartItemsController < ApplicationController
  respond_to :html, :js, :json

  before_filter :find_product, only: [:create_print]
  before_filter :find_user, only: [:destoy, :create_print]
  before_filter :initialize_cart, only: [:create, :create_print]

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
      if @product.save
      redirect_to :back, notice: "Painting has been added to your cart"
      end
    else
      flash "error" 
    end
  end

  def create_print
    @print_category = PrintCategory.find(params[:print_category_id])
   if @product.add_print_to_cart(@user, @print_category)
     redirect_to :back, notice: "A print of #{@product.name} has been added to your cart"
   else
     redirect_to :back, notice: "#{@product.errors.full_messages}"
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
