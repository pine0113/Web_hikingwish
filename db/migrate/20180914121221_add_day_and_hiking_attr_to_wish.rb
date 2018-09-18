class AddDayAndHikingAttrToWish < ActiveRecord::Migration[5.1]
  def change
    add_column :wishes, :day, :integer
  end
end
