class UserMailer < ActionMailer::Base
  default from: "LisaLuree@bone-diva.com"

  def registration_confirmation(user)
    @user = user 
   mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end

  def contact_bonediva(email_addy, message)
  @message = message
  @user = @message.user if @message.user.present?
  @user_email = email_addy
  @emailed_users = ["bonediva@gmail.com", "zerr@twinsoftech.com"]
   mail(:to => @emailed_users, :subject => "#{@message.title}", :from => "#{email_addy}")
  end

end
