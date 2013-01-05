class Picture < ActiveRecord::Base
  #attr_accessible :title, :picture, :image, :remote_image_url
  #attr_protected :id
  mount_uploader :image, ImagesUploader
  accepts_nested_attributes_for :image

  has_many :images
  belongs_to :user

end
