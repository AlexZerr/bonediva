class Painting < ActiveRecord::Base
  mount_uploader :image, ImagesUploader
  attr_accessible :image, :description, :title, :user_id, :remote_image_url

  validates :title, presence: true
  
  belongs_to :user
end
