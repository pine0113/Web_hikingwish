class AddDayAndHikingAttrToWish < ActiveRecord::Migration[5.1]
  def change
    add_column :wishes, :day, :integer
    add_column :wishes, :hiking, :string
  end
end
