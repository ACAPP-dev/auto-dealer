class VehicleSale < ApplicationRecord
    belongs_to :customer
    belongs_to :employee
    belongs_to :vehicle

end
