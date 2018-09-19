class Category < ApplicationRecord
  has_many :hikings
  belongs_to :Category
end
