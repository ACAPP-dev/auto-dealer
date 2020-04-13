class Customer < ApplicationRecord
    has_many :appointments
    has_many :employees, through: :appointments
    
    has_secure_password

    validates :name, :email, presence: true
    validates :email, uniqueness: true
    validates_confirmation_of :password

    accepts_nested_attributes_for :appointments
end
