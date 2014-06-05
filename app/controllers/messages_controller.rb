class MessagesController < ApplicationController

  def new
    @user = current_user
    @message = @user.messages.new
  end

  def create
    @user = current_user
    @message = @user.messages.new(params[:message])
  end

  def destroy
    @message = Message.find(params[:id])
    @mesage.destroy
  end
end
