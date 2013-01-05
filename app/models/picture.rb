class Picture < ActiveRecord::Base

  mount_uploader :images, ImagesUploader
  accepts_nested_attributes_for :image

  has_many :images
  belongs_to :user

end
