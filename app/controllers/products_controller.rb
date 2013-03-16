class ProductsController < ApplicationController

  def index
    if is_admin?
      @products = current_user.products.all
      
    end
    render
  end
  
  def show
    @product = current_user.products.find(params[:id])
    @prod_paint = @product.paintings.first
  end

  def new
    @product = current_user.products.new(params[:product])
    @painting = @product.paintings.new(params[:painting])
    @categories = Category.all
    render
  end

  def create
    @categories = Category.all
    @product = current_user.products.new(params[:product])
     if@product.save
       @painting = @product.paintings.new(params[:painting])
       #if params[:painting][:title].empty?
        @painting.title = @product.name
        @painting.description = @product.description
       #end
       @painting.user_id = current_user.id
       @painting.category_id = @product.category_id
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
    @painting = @product.paintings.new(params[:painting])
    if @painting.save
      @product.update
      redirect_to product_path(@product)
    end
  end

  def update
    @product = Product.find(params[:id])
    @painting = @product.paintings.find(params[:paintable_id])
    if params[:painting][:paintable_id] == @product.id
      @painting.paintable_type = "Product"
      @painting.update
    end
    if @product.update_attributes(params[:product])
      redirect_to product_path(@product), :notice => "your painting has been updated"
    end
  end

  def delete

  end

  def destroy
    @product = Product.find(params[:id])
     if @product.destoy
     end

     respond_to do |format|
       format.js {render :template => 'products/delete.js.erb', :layout => false } 
     end
  end

end
