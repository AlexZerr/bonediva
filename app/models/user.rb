class User < ActiveRecord::Base
  attr_accessible :age, :email, :name, :username, :password_confirmation, :password, :image
  #before_filter :set_current_user
  has_secure_password

  mount_uploader :image, ImagesUploader

  validates_confirmation_of :password
  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :username, presence: true


  has_many :pictures
  #accepts_nested_attributes_for :pictures

  def self.authenticate(email, password)
    find_by_email(email).try(authenticate: password)
  end

end
