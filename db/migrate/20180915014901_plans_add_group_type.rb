class PlansAddGroupType < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :group_type, :string
  end
end
