class SoldProductsController < ApplicationController

  def index
    @sold_products = SoldProduct.order("id DESC").page(params[:page]).per(15)
  end

  def create
    @sold_product = SoldProduct.new(params[:sold_product])
    if @sold_product.save
      redirect_to :root, notice: "Updated to Sold"
    else
      redirect_to :back, notice: "#{@sold_product.errors.full_messages}"
    end
  end

  def edit
    @categories = Category.all
    @product = SoldProduct.find(params[:id])
    @pcats = @product.categories
    @paintings = @product.paintings
    @painting = @product.paintings.new(params[:painting])
    if @painting.save
      @product.update
      redirect_to sold_product_path(@product)
    end
  end

  def update
    @product = SoldProduct.find(params[:id])
    if params[:paintable_id]
      @painting = @product.paintings.find(params[:paintable_id]) 
      if params[:painting][:paintable_id] == @product.id
        @painting.paintable_type = "Product"
        @painting.update
      end
    end
    @product.categories = Category.where(id: params[:categories][:category_id])
    if @product.update_attributes(params[:sold_product])
        @product.paintings.map{|e| e.update_attributes(title: @product.name, description: @product.description)}
        redirect_to sold_product_path(@product), :notice => "your painting has been updated"
    end
  end

  def show
    @sold_product = SoldProduct.find(params[:id])
  end

  def revert_to_product
    @sold_product = SoldProduct.find(params[:sold_product_id])
    if @sold_product.update_sold_product_to_product
      redirect_to :root, notice: "#{@sold_product.name} has been reverted back to a product."
    else
      redirect_to :back, notice: "#{@sold_product.errors.full_messages}"
    end
  end

  def set_sold_main_image
    @sold_product = SoldProduct.find(params[:sold_product_id])
    painting = Painting.find(params[:painting_id])
    if @sold_product.update_to_main_image(painting)
      redirect_to :back, notice: "This painting is now the main image for this product"
    end
  end

  def destroy
    @sold_product = SoldProduct.find(params[:id])
    
  end

end
