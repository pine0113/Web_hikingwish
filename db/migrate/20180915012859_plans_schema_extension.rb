class PlansSchemaExtension < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :type, :string
    add_column :plans, :food_type, :string
    add_column :plans, :food_info, :text
    add_column :plans, :car_type, :string
    add_column :plans, :car_info, :text
    add_column :plans, :money_type, :text
    add_column :plans, :publish_status, :string
    add_column :plans, :lock_status, :string
    add_column :plans, :schedule, :text
  end
end
