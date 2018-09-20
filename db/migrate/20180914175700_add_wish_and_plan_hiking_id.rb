class AddWishAndPlanHikingId < ActiveRecord::Migration[5.1]
  def change
    add_column :wishes, :hiking_id, :integer, default: 1
    add_column :plans, :hiking_id, :integer, default: 1
  end
end
