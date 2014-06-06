class UserMailer < ActionMailer::Base
  default from: "BoneDiva@gmail.com"

  def registration_confirmation(user)
    @user = user 
   mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end

  def contact_bonediva(user, message)
  @user = user 
  @message = message
   mail(:to => ["bonediva@gmail.com", "thwarts@gmail.com"], :subject => "#{@message.title}", from: "#{@user.name}-#{@user.email}")
  end

end
