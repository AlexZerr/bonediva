class BlogPost < ActiveRecord::Base
  mount_uploader :image, EventImgUploader
  attr_accessible :body, :title, :image, :remote_image_url

  belongs_to :user

  
end
