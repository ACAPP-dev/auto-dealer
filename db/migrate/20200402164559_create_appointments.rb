class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :type
      t.string :description
      t.string :date
      t.string :time
      t.integer :customer_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
