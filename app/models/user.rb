class User < ActiveRecord::Base
  attr_accessible :age, :email, :name, :password, :username, :password_confirmation
  #before_filter :set_current_user
  #before_save :encrypt_password

  validates_confirmation_of :password
  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :username, presence: true


  has_many :pictures


  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      redirect_to new_session_path, :notice => "could not authenticate"
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
