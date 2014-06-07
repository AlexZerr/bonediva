class SessionsController < ApplicationController

 

  def new
    @user = current_user
    

  end 


  def create
   @user = User.find_by_email(params[:email])
   if @user.present?
     if @user.authenticate(params[:password])
       session[:user_id] = @user.id
       if !@user.carts.present?
          c =@user.carts.build
          c.save
       end 
       redirect_to :back, :notice => "Logged In"
     else 
       flash.now.alert = "Invalid Email or Password"
       redirect_to :root, notice: "Invalid Email or Password"
      end
   else
     redirect_to :back, notice: "That User Does Not Exist"
   end
  end

  def facebook
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in!"
  end

 def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Logged out!"
 end

end
