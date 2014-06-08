class User < ActiveRecord::Base
  attr_accessible :age, :email, :name, :username, :password_confirmation, :password, :image, :admin, :user_link
  #before_filter :set_current_user
  has_secure_password

 # mount_uploader :image, ImagesUploader

  validates_confirmation_of :password
  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :username, presence: true


  has_many :paintings
  has_many :products
  has_many :cart_items
  has_many :carts
  has_many :cart_items
  has_many :blog_posts
  has_many :user_categories
  has_many :sold_products
  has_many :messages
  has_one :avatar
  
  #accepts_nested_attributes_for :pictures

  def self.authenticate(email, password)
    find_by_email(email).try(authenticate: password)
  end

  def user_avatar(type)
    
  end

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["name"]
      first = auth["info"]["first_name"]
      last = auth["info"]["last_name"]
      user.name = "#{first} #{last}"
      user.oauth_token = auth["credentials"]["token"]
      user.oauth_expires_at = Time.at(auth["credentials"]["expires_at"])
      if auth.info.email.present?
        user.email = auth["info"]["email"]
      else
        user.email = "#{first}@#{last}.com"
      end
      user.password = "password"
      user.password_confirmation = "password"
    end
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    block_given? ? yield(@facebook) : @facebook
      rescue Koala::Facebook::APIError => e
      logger.info e.to_s
    nil # or consider a custom null object
  end

end
