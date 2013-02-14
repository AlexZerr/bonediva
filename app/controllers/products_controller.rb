class ProductsController < ApplicationController

  def index
    if is_admin?
      @products = current_user.products.all
    end
    render
  end
  
  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = current_user.products.new(params[:product])
    @painting = @product.paintings.new(params[:painting])
    @categories = Category.all
    render
  end

  def create
    @product = current_user.products.new(params[:product])
     if@product.save
       @painting = @product.paintings.new(params[:painting])
       @painting.title = @product.name
       @painting.description = @product.description
       @painting.user_id = current_user.id
       @painting.save
       @painting.errors.full_messages
       redirect_to product_path(@product)
     else
       render :new
     end
  end

  def edit
    @product = Product.find(params[:id])
    @paintings = @product.paintings
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
     if @product.destoy
       redirect_to products_path :notice => "Product has been deleted"
     end
  end
end
