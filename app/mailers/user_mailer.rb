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

  def send_transaction_email(order_transaction)
    @order_transaction = order_transaction
    @order = order_transaction.order
    @product_names = @order.sold_products.map{ |e| e.name }.join(", ")
    @message = order_transaction.message
    @user = @order.cart.user
    mail(:to => @user.email, :subject => "Transaction for #{@order.total_price} from Lisa Luree Art", :from => "customer-service@bone-diva.com")
  end

  def notify_of_transaction(order_transaction)
    @order_transaction = order_transaction
    @message = order_transaction.message
    @order = order_transaction.order
    @product_names = @order.sold_products.map{ |e| e.name }.join(", ")
    @user = @order.cart.user
    @emailed_users = ["bonediva@gmail.com", "zerr@twinsoftech.com"]
    mail(:to => @emailed_users, :subject => "Transaction for $#{@order.total_price}.00 from #{@user.name}", :from => "customer-service@bone-diva.com")
  end

end
