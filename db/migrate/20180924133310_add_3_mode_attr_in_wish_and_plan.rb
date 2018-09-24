class Add3ModeAttrInWishAndPlan < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :transport_mode, :integer, :default => 1
    add_column :plans, :fee_mode, :integer, :default => 1
    add_column :plans, :food_mode, :integer, :default => 1
    add_column :wishes, :transport_mode, :integer, :default => 1
    add_column :wishes, :fee_mode, :integer, :default => 1
    add_column :wishes, :food_mode, :integer, :default => 1
  end
end
