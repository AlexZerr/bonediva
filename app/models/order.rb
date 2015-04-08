class Order < ActiveRecord::Base
  attr_accessor :card_number, :card_verification
  serialize :product_ids

belongs_to :cart
belongs_to :user
has_many :cart_items
has_many :sold_products
has_many :transactions, class_name: "OrderTransaction"

#before_create :validate_card
before_create :set_user

  def purchase
    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)

    
    response.success?
  end

  def create_transaction
    transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
    cart.update_attribute(:purchased_at, Time.now) if response.success?
  end


  def price_in_cents
    (self.total_price * 100).round
  end

  def civil_created
    created_at.strftime("%m/%d/%Y %I:%M %p")
  end

  private

  def set_user
    usr = cart.user
    self.user_id = usr.id
  end

#  def purchase_options
#    {
#      ip: ip_address,
#      billing_address: {
#        name:     "#{first_name} #{last_name}",
#        address:  address,
#        city:     city,
#        state:    state,
#        country:  country,
#        zip:      zip_code
#      }
#    }
#  end


#    def credit_card
#    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
#      :brand               => brand,
#      :number             => card_number,
#      :verification_value => card_verification,
#      :month              => card_expires_on.month,
#      :year               => card_expires_on.year,
#      :first_name         => first_name,
#      :last_name          => last_name
#    )
#  end

#  def validate_card
#    unless credit_card.valid?
#      credit_card.errors.full_messages.each do |message|
#       errors.add_to_base message
#      end
#    end
#  end
end
