class Avatar < ActiveRecord::Base

  mount_uploader :image, AvatarUploader

  attr_accessible :image
  
  belongs_to :user
end
