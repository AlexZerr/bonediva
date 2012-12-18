class User < ActiveRecord::Base
  validate :name, presence: true, uniqueness: true
  validate :email, presence: true, uniqueness: true
  validate :password, presence: true, 
  
end
