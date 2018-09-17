class ChangeHikingToRoutename < ActiveRecord::Migration[5.1]
  def change
    rename_column :wishes, :hiking, :routename
  end
end
