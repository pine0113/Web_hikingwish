class Numberofday < ApplicationRecord
  has_many :plans
  has_many :wishes
  #has_many :plans, :class_name => 'Plan', :foreign_key => 'day'
  #has_many :wishes, :class_name => 'Wish', :foreign_key => 'day'

end
