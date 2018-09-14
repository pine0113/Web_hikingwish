class Wish < ApplicationRecord
  validates :name, :presence => true # 一定要有標題
  validates :user_id, :presence => true # 一定要有user id
  has_many :notification, :as => :notifiable
  belongs_to :user
end
