class Message < ActiveRecord::Base
  after_save :send_bone_diva_message

  attr_accessible :title, :body, :user_email
  belongs_to :user


  private
  def send_bone_diva_message
    UserMailer.contact_bonediva(user_email, self).deliver
  end

end
