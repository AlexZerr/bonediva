class AvatarsController < ApplicationController

  def new
    @user = user.find(params[:user_id])
    @avatar = @user.avatar.new(params[:avatar])
  end

  def create
    @user = current_user
      @avatar = Avatar.new(params[:avatar])
    if @avatar.save
      redirect_to :back, notice: "Avatar created"
    else
      redirect_to :back, notice: "#{ @avatar.errors.full_message}"
    end
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
