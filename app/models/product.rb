
class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price, :size

  validates :name, presence: true
  validates :price, presence: true
  validates :size, presence: true
  #ensure_admin

  belongs_to :user
  has_many :paintings
end
