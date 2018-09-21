class Messenge < ApplicationRecord
  belongs_to :chatable, :polymorphic => true
  belongs_to :user
  
end
