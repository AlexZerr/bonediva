class User < ActiveRecord::Base
  attr_accessible :age, :email, :name, :password, :username

  has_many :pictures
end
