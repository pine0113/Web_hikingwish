class AddCateIdToHiking < ActiveRecord::Migration[5.1]
  def change
    add_column :hikings, :cate_id, :integer
  end
end
