class PaintingsController < ApplicationController

  before_filter :ensure_admin, only: [:destroy]

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
      redirect_to @painting, :notice => "#{@painting.title} was created sucessfully"
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
    redirect_to root, :notice => "#{@painting.title} has been terminated!"
  end

 private

end
