class Picture < ActiveRecord::Base
  #attr_accessible :image, :remote_image_url
  mount_uploader :image, ImagesUploader
  accepts_nested_attributes_for :image

  has_many :images
  belongs_to :user

end
