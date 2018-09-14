class AddDescriptionToWish < ActiveRecord::Migration[5.1]
  def change
    add_column :wishes, :description, :text
  end
end
