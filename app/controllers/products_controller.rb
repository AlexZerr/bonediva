class ProductsController < ApplicationController
  respond_to :js, :html
  

  def index
    if params[:search].present?
      @pros = Product.where("LOWER(name) ILIKE ? OR LOWER(description) ILIKE ?", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%").order("id DESC")
      @sold_products = SoldProduct.where("LOWER(name) ILIKE ? OR LOWER(description) ILIKE ?", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%").order("id DESC")
    elsif params[:description_search].present?
      @pros = Product.where("LOWER(description) ILIKE ?", "%#{params[:description_search].downcase}%").order("id DESC")
      @sold_products = SoldProduct.where("LOWER(description) ILIKE ?", "%#{params[:description_search].downcase}%").order("id DESC")
    else
      @pros = Product.order("id DESC")
      @sold_products = SoldProduct.order("id DESC")
    end
    products = @pros + @sold_products
    @products = Kaminari.paginate_array(products).page(params[:page]).per(25)
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
    if @product.update_product_to_sold_product
      redirect_to :root, notice: "#{@product.name} has been updated to sold!"
    else
      redirect_to :back, notice: "#{@product.errors.full_messages}"
    end
#    @sold_product = SoldProduct.new(params[:sold_product])
#    @primary_painting = Painting.find(@product.primary_painting_id) if @product.primary_painting_id.present?
#    @sold_product.name = @product.name
#    @sold_product.description = @product.description
#    @sold_product.size = @product.size
#    @sold_product.price = @product.price
#    @sold_product.user_id = @product.user_id
#    @sold_product.sold_at = Time.now
#    @sold_product.primary_painting_id = @primary_painting.id if @primary_painting
    
#    if @product.category_id.present?
#      @sold_product.category_id = @product.category_id
#    end
#    if @sold_product.save
#      @product.sold = true
#      @product.paintings.map{|e| e.update_attributes(sold_product_id: @sold_product.id, paintable_type: "SoldProduct", paintable_id: @sold_product.id)}
#      @product.destroy
#      redirect_to :root, notice: "Product has been sold"
#    end
  end

  def aceo
    @products = Product.where(aceo: true).order("id DESC").page(params[:page]).per(25)
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
    if params[:paintable_id]
      @painting = @product.paintings.find(params[:paintable_id]) 
      if params[:painting][:paintable_id] == @product.id
        @painting.paintable_type = "Product"
        @painting.update
      end
    end
    if @product.update_attributes(params[:product])
        @product.paintings.map{|e| e.update_attributes(title: @product.name, description: @product.description)}
        redirect_to product_path(@product), :notice => "your painting has been updated"
    end
  end

  def delete

  end

  def destroy
    @product = Product.find(params[:id])
    @paintings = @product.paintings
    @cart_item = CartItem.where( id: @product.cart_item_id)
    if current_user.admin?
     if @product.destroy
       if @cart_item.present?
         @cart_item.destroy
       end 
       if @paintings.present?
         @paintings.destroy
       end
       redirect_to products_path
     end
    end

#     respond_to do |format|
 #      format.js {render :template => 'products/destroy.js.erb', :layout => false } 
  #   end
     private

     def product_painting_sync(product)
      paintings = product.paintings
      
      
     end

  end

end
