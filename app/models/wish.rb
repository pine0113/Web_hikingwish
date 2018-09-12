class Wish < ApplicationRecord
  validates :name, :presence => true # 一定要有標題
  validates :user_id, :presence => true # 一定要有user id

  belongs_to :user
end
