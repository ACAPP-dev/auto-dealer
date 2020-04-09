class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.integer :make_id
      t.integer :carname_id
      t.string :year
      t.integer :price
      t.integer :doors
      t.string :body_style
      t.string :vin
      t.string :transmission
      t.string :description
      t.string :drivetrain
      t.string :fuel_type
      t.integer :mileage
      t.string :ext_color
      t.string :int_color
      t.integer :mileage_city
      t.integer :mileage_hwy
      t.string :type 
      t.string :options
      t.string :vehicle_search
      t.boolean :sold, default: false
      t.timestamps
    end
  end
end
