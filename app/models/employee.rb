class Employee < ApplicationRecord
    has_many :appointments
    has_many :customers, through: :appointments
    has_many :vehicle_sales
    has_many :vehicles, through: :vehicle_sales

    has_secure_password

    validates :name, :email, presence: true
    validates :email, uniqueness: true
    validates_confirmation_of :password
end
