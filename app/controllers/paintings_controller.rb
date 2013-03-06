class PaintingsController < ApplicationController

  before_filter :ensure_admin, only: [:destroy]

  def index
    @paintings = Painting.all
    @user = current_user
    @products = @user.products.all
  end

  def new
    @painting = Painting.new(params[:painting])
    @user = current_user
    @users = User.all
    @categories = Category.all
    
  end

  def create
    if current_user.present?
      @painting = Painting.new(params[:painting].merge(paintable_type: 'Category'))
      @painting.user_id = current_user.id
    else
      redirect_to new_user_path, :notice => "You must be logged in to add a picture"
    end
    if @painting.save
      redirect_to @painting, :notice => "#{@painting.title} was created sucessfully"
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
    @category = Category.find(params[:id])
    @painting = Painting.find(params[:id])
    @painting.update_attributes(params[:painting])
     if @painting.save
       @painting.category_id = @category.id
     end

  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy

    respond_to do |format|
      format.js { render :template => 'paintings/delete.js.erb', :layout => false }
    end
  end

end

