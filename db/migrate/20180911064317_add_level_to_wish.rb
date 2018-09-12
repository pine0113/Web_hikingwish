class AddLevelToWish < ActiveRecord::Migration[5.1]
  def change
    add_column :wishes, :level, :integer
  end
end
