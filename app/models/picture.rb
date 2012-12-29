class Picture < ActiveRecord::Base
 i# attr_accessible :description, :title, :image
  mount_uploader :image, ImagesUploader
  #accepts_nested_attributes_for :images

  belongs_to :user

end
