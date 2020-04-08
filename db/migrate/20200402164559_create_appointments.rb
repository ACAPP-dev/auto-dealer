class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :appt_type
      t.string :description
      t.string :appt_date
      t.string :appt_time
      t.integer :customer_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
