class AddDayAndHikingAttrToWish < ActiveRecord::Migration[5.1]
  def change
    add_column :wishes, :numberofday_id, :integer, default: 10
  end
end
