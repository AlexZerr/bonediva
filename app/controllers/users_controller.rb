class UsersController < ApplicationController

  respond_to :html, :js
  force_ssl
  # before_filter :ensure_authorized, only: [ :edit, :update, :delete ] 


  def index
    @users = User.all
   # @user = User.find(params[:id])
    render
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @paintings = if current_user.present? 
                  @user.paintings
                 else
                  redirect_to root_path, :notice => "log in"
                 end 
  end


  def edit
    @user = User.find(params[:id])
    @paintings = current_user.paintings
    if @user.avatar.present?
      @avatar = @user.avatar
    else
      @avatar = Avatar.new(params[:avatar])
    end

  end


  def update
    @user = User.find(params[:id])
    @avatar = @user.avatar
    if @avatar.present?
       @avatar.update_attributes(params[:avatar])
    else
      @avatar = Avatar.new(params[:avatar])
    end
    @avatar.save
      if @user.update_attributes(params[:user])
        redirect_to user_path(@user), :notice => "User Succesfully Updated"
      else
        redirect_to :back, :notice => "There was an error updating #{@user.name}"
      end
    end


  def create
    @user = User.new(params[:user])
    if @user.save
      #UserMailer.registration_confirmation(@user).deliver
        @avatar = Avatar.new(params[:avatar])
          @avatar.name = @user.name
          @avatar.user_id = @user.id
        @avatar.save
        @cart = @user.carts.new(params[:cart]) if !@user.carts.present?
        @cart.save
      redirect_to user_path(@user), :notice => " #{@user.name} was created sucessfully"
    else
     redirect_to new_user_path, :notice => " Fields must be filled out." 
    end
  end


  def delete

  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path :notice => "#{ @user.name } has been destroyed"
    end
  end

  def new
   if !current_user.present? 
    @user = User.new(params[:user])
    if params[:avatar].present?
      @avatar = Avatar.update_attributes(params[:avatar])
    else
      @avatar = Avatar.new(params[:avatar])
    end
   else
     @user = current_user
   end
    @new_picture = Picture.new(params[:picture])
  end

  def logged_in?
    User.find(session[:id])
  end

end
