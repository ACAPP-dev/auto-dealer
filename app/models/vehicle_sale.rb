class VehicleSale < ApplicationRecord

    belongs_to :customer
    belongs_to :employee
    has_one :vehicle

end
