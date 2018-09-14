class Wish < ApplicationRecord
  validates :name, :presence => true # 一定要有標題
  validates :user_id, :presence => true # 一定要有user id

  belongs_to :user

  acts_as_taggable_on :car
  acts_as_taggable_on :food
end
