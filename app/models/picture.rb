class Picture < ActiveRecord::Base

  mount_uploader :image, ImagesUploader

  has_many :images
  belongs_to :user

end
