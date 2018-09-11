class Hiking < ApplicationRecord
  validates_presence_of :name
  mount_uploader :image, ImageUploader
end
