class PaintingsController < ApplicationController

  before_filter :ensure_admin, only: [:destroy]

  def index
    @paints = Painting.where(paintable_type: "Category")
   @prod_paints = Painting.where(paintable_type: "Product", primary_painting: true) 
    @user = current_user
    @paintings = @prod_paints + @paints
  end

  def new
    @painting = Painting.new(params[:painting])
    @user = current_user
    @users = User.all
    @categories = Category.all
  end

  def create
    if current_user.present?
      @painting = current_user.paintings.new(params[:painting])
      @painting.user_id = current_user.id
    else
      redirect_to new_user_path, :notice => "You must be logged in to add a picture"
    end
    if @painting.save
      @painting.update_attributes(category_id: @painting.paintable_id)
      redirect_to painting_path(@painting), :notice => "#{@painting.title} was created sucessfully"
    end
  end

  def show
    @painting = Painting.find(params[:id])
    @users = User.all
    @user = current_user
  end

  def edit

  end

  def update
    @painting = Painting.find(params[:id])
      if params[:painting][:paintable_id] == @painting.category.id
        @painting.update_attributes(paintable_type: "Category")
      else
        @painting.update_attributes(paintable_type: "Product")
      end
      @painting.update_attributes(params[:painting])
     if @painting.save
      @category = Category.find_by_id(params[:id])
      @painting.update_attributes(category_id: @category.id)
     end 

  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy

    respond_to do |format|
      format.js { render :template => 'paintings/delete.js.erb', :layout => false }
    end
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

end

