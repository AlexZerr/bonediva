class UserMailer < ActionMailer::Base
  default from: "BoneDiva@gmail.com"

  def registration_confirmation(user)
    @user = user 
   mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end

end
