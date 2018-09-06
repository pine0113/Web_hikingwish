class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # email 跟 password欄位 deivse 已強制要求
  validates_presence_of :name

  def admin?
    self.role == "admin"
  end

end
