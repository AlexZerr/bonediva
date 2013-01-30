
class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price, :size

  has_many :paintings, as: :paintable

  validates :name, presence: true
  validates :price, presence: true
  validates :size, presence: true
  #ensure_admin

  belongs_to :user
end
