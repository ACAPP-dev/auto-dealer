class CreateVehicleSales < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicle_sales do |t|
      t.float :cost
      t.float :price
      t.string :date
      t.integer :customer_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
