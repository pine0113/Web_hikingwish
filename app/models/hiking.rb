class Hiking < ApplicationRecord
  validates_presence_of :name
  mount_uploader :image, ImageUploader
  acts_as_taggable_on :tags
  
  has_many :plans
  has_many :wishes
end
