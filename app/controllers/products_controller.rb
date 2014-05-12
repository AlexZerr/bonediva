class ProductsController < ApplicationController
  respond_to :js, :html
  

  def index
    if params[:search].present?
      @products = Product.where("LOWER(name) ILIKE ? OR LOWER(description) ILIKE ?", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%")
    elsif params[:description_search].present?
      @products = Product.where("LOWER(description) ILIKE ?", "%#{params[:description_search].downcase}%")
    else
      @products = Product.all
    end
    if params[:search].present?
      @sold_products = SoldProduct.where("LOWER(name) ILIKE ? OR LOWER(description) ILIKE ?", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%")
    elsif params[:description_search].present?
      @sold_products = SoldProduct.where("LOWER(description) ILIKE ?", "%#{params[:description_search].downcase}%")
    else
      @sold_products = SoldProduct.all
    end
    @user = current_user
    @cart = @user.carts.last if @user.present?
    @categories = Category.all
    respond_with @products
  end
  
  def show
    @user = current_user
    if @user.present?
      if @user.carts.present?
        @cart = @user.carts.last
      else
        @cart = Cart.create(params[:cart])
      end
    end 
    @product = Product.find(params[:id])
    @prod_paint = @product.paintings.first
    @products = Product.all
    @aceos = Product.where(aceo: true)
  end

  def update_to_sold
    @product = Product.find(params[:product_id])
    @sold_product = SoldProduct.new(params[:sold_product])
    @primary_painting = Painting.find(@product.primary_painting_id) if @product.primary_painting_id.present?
    @sold_product.name = @product.name
    @sold_product.description = @product.name
    @sold_product.size = @product.size
    @sold_product.price = @product.price
    @sold_product.user_id = @product.user_id
    @sold_product.sold_at = Time.now
    @sold_product.primary_painting_id = @primary_painting.id if @primary_painting
    
    if @product.category_id.present?
      @sold_product.category_id = @product.category_id
    end
    if @sold_product.save
      @product.sold = true
      @product.paintings.map{|e| e.update_attributes(sold_product_id: @sold_product.id, paintable_type: "Sold", paintable_id: @sold_product.id)}
      @product.destroy
      redirect_to :root, notice: "Product has been sold"
    end
  end

  def aceo
    @products = Product.where(aceo: true)
  end

  def about_aceo
    render
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
       if @product.aceo = true
         @painting.aceo = true
       end
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
    @paintings = @product.paintings
    @cart_item = CartItem.where( id: @product.cart_item_id)
     if @product.destroy
       if @cart_item.present?
         @cart_item.destroy
       end 
       if @paintings.present?
         @paintings.destroy
       end
       redirect_to products_path
     end

#     respond_to do |format|
 #      format.js {render :template => 'products/destroy.js.erb', :layout => false } 
  #   end
  end

end
