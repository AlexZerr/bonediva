class Painting < ActiveRecord::Base
  mount_uploader :image, ImagesUploader
  attr_accessible :image, :description, :title, :user_id, :remote_image_url, :id, :paintable_type, :paintable_id, :home

  belongs_to :paintable, polymorphic: true
  belongs_to :category
  validates :title, presence: true

def is_home_image?(painting)
  painting.home?
end
  
end
