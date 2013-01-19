class PaintingsController < ApplicationController

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
    @painting = current_user.paintings.find(params[:id])
    @users = User.all
    @user = current_user
  end

end
