class Hiking < ApplicationRecord
  validates_presence_of :name
  mount_uploader :image, ImageUploader

  has_many :plans
  has_many :wishes
end
