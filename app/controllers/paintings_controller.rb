class PaintingsController < ApplicationController

  before_filter :ensure_admin, only: [:destroy]

  def index
    @paintings = Painting.all
    @user = current_user
    @products = @user.products.all
  end

  def new
    @painting = Painting.new(params[:painting])
      if @painting.save
        @painting.update_attributes([:paintable_type] => "Category")
      end
    @user = current_user
    @users = User.all
    @categories = Category.all
  end

  def create
    if current_user.present?
    @painting = current_user.paintings.new(params[:painting])
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
    @painting = Painting.find(params[:id])
    @painting.update_attributes(params[:painting])
     @painting.save

  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy

    respond_to do |format|
      format.js { render :template => 'paintings/delete.js.erb', :layout => false }
    end
  end

end

