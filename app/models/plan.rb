class Plan < ApplicationRecord
  belongs_to :user , :class_name => "User", :foreign_key => "owner_id"
end
