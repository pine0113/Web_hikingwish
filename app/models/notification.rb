class Notification < ApplicationRecord
  belongs_to :notifiable, :polymorphic => true
  belongs_to :users
  
end
