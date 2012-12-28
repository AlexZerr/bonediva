class Picture < ActiveRecord::Base
  attr_accessible :description, :title
  mount_uploader :picture, PicturesUploader

  belongs_to :user

end
