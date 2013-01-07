class Picture < ActiveRecord::Base
#  mount_uploader :image, ImagesUploader
  validates :image, presence: true
  validates_presence_of :title
  validates_presence_of :discription

  has_many :images
  belongs_to :user

end
