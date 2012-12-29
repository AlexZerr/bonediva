class User < ActiveRecord::Base
  attr_accessible :age, :email, :name, :password, :username

  validates :name, presence: true
  validates :username, presence: true
  has_many :pictures
end
