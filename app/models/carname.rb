class Carname < ApplicationRecord
    has_many :vehicles

    scope :vehicle_models, -> {includes(:vehicles).where.not(vehicles: {id: nil})}

end
