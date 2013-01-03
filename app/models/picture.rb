class Picture < ActiveRecord::Base
  attr_accessible :description, :title, :image, :remote_image_url
  mount_uploader :image, ImagesUploader
  accepts_nested_attributes_for :images

  belongs_to :user

end
