class PaintingsController < ApplicationController

  def index
    @paintings = Painting.all
    @user = current_user
  end

  def new
    @painting = Painting.new(params[:painting])
    @user = current_user
    @users = User.all
  end

  def create
    @painting = current_user.paintings.new(params[:painting])
    if @painting.save
      redirect_to @painting
    end
  end

  def show
    @painting = Painting.find(params[:id])
    @users = User.all
    @user = current_user
  end

   def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
    respond_with @painting
  end

end
