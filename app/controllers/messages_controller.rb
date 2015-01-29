class MessagesController < ApplicationController
  respond_to :html, :js, :json

  def new
    if current_user
      @user = current_user
      @message = @user.messages.new if current_user.present?
    else
      @message = Message.new
    end
  end

  def create
    if current_user
      @user = current_user
      @message = @user.messages.new(params[:message])
      @message.user_email = @user.email
    else
      build_message_with_no_user
    end
    if @message.save
      #UserMailer.contact_bonediva(@user, @message).deliver
      redirect_to :root, notice: "Message has been sent!"
    else
      redirect_to :back, notice: "#{@message.errors.full_messages}"
    end
  end
  
  def index
    respond_with Message.all
  end

  def destroy
    @message = Message.find(params[:id])
    @mesage.destroy
  end

  private

  def build_message_with_no_user
    @message = Message.new(params[:message])
  end
end
