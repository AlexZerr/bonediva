ActionMailer::Base.smtp_settings = {
  :address              => "smtp.mailgun.org",
  :port                 => 587,
  :domain               => "bone-diva.com",
  :user_name            => "postmaster@bone-diva.com",
  :password             => "19tj6djq5-b5",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options = { host: "http://www.bone-diva.com" }
