class AvatarsController < ApplicationController

  def new
    @user = user.find(params[:user_id])
    @avatar = @user.avatar.new(params[:avatar])
  end

  def create
    @user = User.find(params[:user_id])
    @avatar = @user.avatar.new(params[:avatar])
    @avatar.save
  end

  def update
    @user = current_user
    if @user.avatar.present?
     @avatar = @user.avatar
    else 
      @avatar = Avatar.new(params[:avatar])
    end
    @avatar.update_attributes(params[:avatar])
    if @avatar.save
      redirect_to :back, notice: "Avatar Updated"

    end

  end

  
end
