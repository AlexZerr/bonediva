class MessagesController < ApplicationController

  def new
    @user = current_user
    @message = @user.messages.new
  end

  def create
    @user = current_user
    @message = @user.messages.new(params[:message])
    @message.user_email = @user.email
    if @message.save
      UserMailer.contact_bonediva(@user, @message).deliver
      redirect_to :root, notice: "Message has been sent!"

    end
  end

  def destroy
    @message = Message.find(params[:id])
    @mesage.destroy
  end
end
