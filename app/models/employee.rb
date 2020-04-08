class Employee < ApplicationRecord
    has_many :appointments
    has_many :vehicle_sales
    has_many :vehicle_sales, through: :vehicle_sales

    has_secure_password

    validates_confirmation_of :password
end
