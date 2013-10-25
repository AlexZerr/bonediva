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

  def destroy
    @painting.destroy
    respond_with @painting
  end

  def add_product_painting
    @product = Product.find(params[:product_id])
    @painting = @product.paintings.build(params[:painting])
    @painting.paintable_type = "Product"
    @painting.paintable_id = @product.id
    @painting.category_id = @product.category_id
    if @painting.save
      redirect_to @product
    end
  end

  private

  def find_painting
    @painting = Painting.find(params[:id]) if params[:id].present?
  end

end

