class Picture < ActiveRecord::Base


  validates :name, presence: true
end
