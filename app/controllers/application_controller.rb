class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    @user = current_user
  end

 # def set_current_user 
  #  Authorization.current_user = current_user
 # end


  private

  def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  helper_method :current_user

end
