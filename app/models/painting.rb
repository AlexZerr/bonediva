class Painting < ActiveRecord::Base
  mount_uploader :image, ImagesUploader
  attr_accessible :image, :description, :title, :user_id, :remote_image_url, :id, :paintable_type, :paintable_id

  belongs_to :paintable, polymorphic: true
  validates :title, presence: true
  
end
