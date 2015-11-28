class PaintingsController < ApplicationController
  respond_to :html, :js, :json
  before_filter :ensure_admin, only: [:destroy]
  before_filter :find_painting, only:[:show, :update, :destroy, :index]

  def index
    @paints = Painting.where(paintable_type: "Category")
   @prod_paints = Painting.where(paintable_type: "Product", primary_painting: true) 
    
    @paintings = @prod_paints + @paints
  end

  def new
    @painting = Painting.new(params[:painting])
    @user = current_user
    @users = User.all
    @categories = Category.all
      #if @user.user_categories.present?
        @user_cats = @user.user_categories
      #else
        #@user_cats = "none"
      #end 
  end

  def create
    if current_user.present?
      @painting = current_user.paintings.new(params[:painting])
      @painting.user_id = current_user.id
    else
      redirect_to new_user_path, :notice => "You must be logged in to add a picture"
    end
      if params[:painting][:user_category_id].present?
        @painting.paintable_type = "UserCategory"
        @painting.paintable_id = @painting.user_category_id
      elsif params[:painting][:category_id].present?
        @painting.paintable_type = "Category"
        @painting.paintable_id = @painting.category_id
      elsif @painting.paintable_type = "Product"
        @product = Product.find(@painting.paintable_id)

        if !params[:name].present?
          @painting.title = @product.name
        end
        if !params[:description].present?
          @painting.description = @product.description
        end
      end
    if @painting.save

        #@painting.update_attributes(params[:painting])
      redirect_to painting_path(@painting), :notice => "#{@painting.title} was created sucessfully"
    end
  end

  def show
    @users = User.all
    @user = current_user
    @product = Product.find_by_id(@painting.paintable_id) if @painting.paintable_type == "Product"
  end

  def edit

  end

  def update
      if params[:painting][:paintable_id] == @painting.category_id
        @painting.paintable_type = "Category"
      elsif params[:painting][:user_category_id] == @painting.user_category_id
        @painting.paintable_type = "UserCategory"
        @painting.paintable_id = @painting.user_category_id
      else
        @painting.paintable_type = "Product"
      end
      @painting.save
      @painting.update_attributes(params[:painting])
      respond_with @painting
#     if @painting.save
#      @category = @painting.category
#      @painting.update_attributes(category_id: @category.id)
#     end 
  end

  def delete

  end

  def destroy
    if @painting.paintable_type == "Product"
      product = Product.find(@painting.paintable_id)
    elsif @painting.paintable_type == "SoldProduct"
      product = SoldProduct.find(@painting.paintable_id)
    end
    if product.paintings.count > 1
      if product.primary_painting_id != @painting.id
       if @painting.destroy
         redirect_to product
       end
      else
        redirect_to :back, notice: "This is the primary painting for the product. Change to primary painting and try again."
      end
    else
      redirect_to :back, notice: "There must be at least one painting for a product."
    end
  end

  def add_product_painting
    @product = Product.find(params[:product_id])
    @painting = @product.paintings.build(params[:painting])
    @painting.paintable_type = "Product"
    @painting.paintable_id = @product.id
    @painting.category_id = @product.category_id
    if @painting.save
              redirect_to product_path(@product)
    end
  end

  def set_as_home_image
    @painting = Painting.find(params[:id])
    @painting.make_home_image
    redirect_to :back, notice: "Painting has been set as the Main Image on the Homepage"
  end

  def remove_home_image
    find_painting
    @painting.deselect_home_image
    redirect_to :back, notice: "This Will No Longer Be A Featured Painting"
  end

  private

  def find_painting
    @painting = Painting.find(params[:id]) if params[:id].present?
  end

end

