class Picture < ActiveRecord::Base
#  mount_uploader :image, ImagesUploader
  validates :image, presence: true
  validates :title, presence: true
  validates :discription, presence: true

  has_many :images
  belongs_to :user

end
