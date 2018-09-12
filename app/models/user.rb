class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  # email 跟 password欄位 deivse 已強制要求
  validates_presence_of :name

  has_many :plans

  def admin?
    self.role == "admin"
  end

end
