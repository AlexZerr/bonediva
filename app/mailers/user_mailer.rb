class UserMailer < ActionMailer::Base
  default from: "LisaLuree@bone-diva.com"

  def registration_confirmation(user)
    @user = user 
   mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end

  def contact_bonediva(user, message)
  @user = user 
  @message = message
  @emailed_users = ["bonediva@gmail.com", "zerr@twinsoftech.com"]
   mail(:to => @emailed_users, :subject => "#{@message.title}", :from => "#{@user.email}")
  end

end
