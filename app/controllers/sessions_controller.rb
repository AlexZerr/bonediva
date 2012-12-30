class SessionsController < ApplicationController

 
  def index
    
  end


  def new
  end 


 def create
   @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Logged In"
    else
      redirect_to sessions_path, :notice => "Sorry, your login failed."
      render
    end
  end

 def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Logged out!"
 end
end
