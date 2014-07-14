class MessagesController < ApplicationController
  respond_to :html, :js, :json

  def new
    @user = current_user
    @message = @user.messages.new
  end

  def create
    @user = current_user
    @message = @user.messages.new(params[:message])
    @message.user_email = @user.email
    if @message.save
      if UserMailer.contact_bonediva(@user, @message).deliver
        redirect_to :root, notice: "Message has been sent!"
      else
        redirect_to :root, notice: "#{@message.errors.full_messages}"
      end

    end
  end

  def destroy
    @message = Message.find(params[:id])
    @mesage.destroy
  end
end
