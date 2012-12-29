class Picture < ActiveRecord::Base
  attr_accessible :description, :title
  mount_uploader :image, PicturesUploader

  belongs_to :user

end
