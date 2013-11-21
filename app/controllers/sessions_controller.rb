class SessionsController < ApplicationController

 

  def new
    @user = current_user
    

  end 


 def create
   @user = User.find_by_email(params[:email])
   if @user.authenticate(params[:password])
     session[:user_id] = @user.id
     redirect_to :root, :notice => "Logged In"
   else 
     flash.now.alert = "Invalid Email or Password"
     redirect_to :root, notice: "Invalid Email or Password"
    end
  end

 def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Logged out!"
 end

end
