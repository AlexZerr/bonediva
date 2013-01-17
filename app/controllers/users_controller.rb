class UsersController < ApplicationController

  respond_to :html, :js
  force_ssl
  # before_filter :ensure_authorized, only: [ :edit, :update, :delete ] 


  def index
    @user = current_user
    @users = User.all

   # @user = User.find(params[:id])
    render
  end

  def show
    @user   = User.find(params[:id])
    @users = User.all
    @paintings = Painting.where(user_id: params[:id])
    
    #@pictures = Picture.find_by_user_id(params[:user_id])
    #@pictures = @user.pictures.order('id desc').image.limit(10) 
  end


  def edit
    @user = User.find(params[:id])
    @painting = current_user.paintings

  end


  def update
    @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        redirect_to user_path(@user), :notice => "User Succesfully Updated"
      else
        redirect_to :back, :notice => "There was an error updating #{@user.name}"
      end
    end


  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to user_path(@user), :notice => " #{@user.name} was created sucessfully"
    else
     redirect_to new_user_path, :notice => " Fields must be filled out." 
    end
  end


  def delete

  end

  def new
    @user = User.new(params[:user])
    @new_picture = Picture.new(params[:picture])
  end

end
