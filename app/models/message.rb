class Message < ActiveRecord::Base

  attr_accessible :title, :body, :user_email
  belongs_to :user

end
