class UserCategory < ActiveRecord::Base

  attr_accessible :name, :description

  belongs_to :user
  has_many :paintings

end
