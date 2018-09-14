class AddWishAndPlanHikingId < ActiveRecord::Migration[5.1]
  def change
    add_column :wishes, :hiking_id, :integer
    add_column :plans, :hiking_id, :integer
  end
end
