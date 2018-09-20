class Wish < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name, :presence => true # 一定要有標題
  validates :user_id, :presence => true # 一定要有user id
  has_many :notification, :as => :notifiable
  belongs_to :user
  belongs_to :hiking
  belongs_to :numberofday
  #belongs_to :paid_user, :class_name => "User", :foreign_key => "paid_user_id"

  acts_as_taggable_on :car
  acts_as_taggable_on :food
end
