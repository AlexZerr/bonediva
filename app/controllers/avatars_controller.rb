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

  
end
