class Customer < ApplicationRecord
    has_many :appointments
    has_many :vehicle_sales
    has_many :vehicle_purchases, through: :vehicle_sales

    has_secure_password

    validates :name, :email, presence: true 
    validates_confirmation_of :password

    accepts_nested_attributes_for :appointments
end
