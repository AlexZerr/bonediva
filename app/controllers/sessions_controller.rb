class SessionsController < ApplicationController

 
  def index
    
  end


  def new
  end 


 def create
   @user = User.find_by_email(:email)
   if @user.authenticate(params[:password])
     session[:user_id] = @user.id
     redirect_to root_url, :notice => "Logged In"
   else 
     flash.now.alert = "Invalid Email or Password"
     render "new"
    end
  end

 def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Logged out!"
 end

end
