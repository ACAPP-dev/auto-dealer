class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :emp_type
      t.integer :access_level

      t.timestamps
    end
  end
end
