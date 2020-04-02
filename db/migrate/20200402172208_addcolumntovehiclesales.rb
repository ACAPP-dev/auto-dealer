class Addcolumntovehiclesales < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicle_sales, :vehicle_id, :integer
  end
end
