class Customer < ApplicationRecord
    has_many :appointments
    has_many :vehicle_sales
    has_many :vehicle_purchases, through: :vehicle_sales

end
