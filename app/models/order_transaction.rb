class OrderTransaction < ActiveRecord::Base
  belongs_to :order
  after_create :send_transaction_notification

   serialize :params
  
  def response=(response)
    self.success       = response.success?
    self.authorization = response.authorization
    self.message       = response.message
    self.params        = response.params
  rescue ActiveMerchant::ActiveMerchantError => e
    self.success       = false
    self.authorization = nil
    self.message       = e.message
    self.params        = {}
  end

  def send_transaction_notification
    UserMailer.send_transaction_email(self).deliver
    UserMailer.notify_of_transaction(self).deliver
  end

end
