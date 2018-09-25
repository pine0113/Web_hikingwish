class Messenge < ApplicationRecord
  belongs_to :chatable, :polymorphic => true
  belongs_to :user, :foreign_key => 'user_id'
  
end
