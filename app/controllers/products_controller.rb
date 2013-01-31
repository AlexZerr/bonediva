class ProductsController < ApplicationController

  def index
    @products = Product.all
    render
  end
  
  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = current_user.products.new(params[:product])
    @painting = @product.paintings.new(params[:painting])
    render
  end

  def create
    @product = current_user.products.new(params[:product])
     if@product.save
       @painting = @product.paintings.new(params[:painting])
       @painting.title = @product.name
       @painting.user_id = current_user.id
       @painting.save
       @painting.errors.full_messages
       redirect_to product_path(@product)
     else
       render :new
     end
  end

  def edit

  end

  def update
    @product = Product.find(params[:id])
    @painting = @product.paintings.find(params[:id])
    if params[:painting][:paintable_id].present?
      @painting.paintable_type = "Product"
    end
      @painting.update
    if @product.update_attributes(params[:product])
      redirect_to product_path(@product), :notice => "your painting has been updated"
    end
  end

  def delete

  end

  def destroy
    @product = Product.find(params[:id])
     @product.destoy
  end
end
