class Vehicle < ApplicationRecord
    belongs_to :make
    belongs_to :carname
    has_many :photos
    has_one :vehicle_sale

end
