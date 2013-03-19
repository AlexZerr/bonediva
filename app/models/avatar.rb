class Avatar < ActiveRecord::Base

  mount_uploader :image, AvatarUploader

  attr_accessible :image, :name, :remote_image_url
  
  belongs_to :user


end
