class Carname < ApplicationRecord
    has_many :vehicles

    def self.vehicle_models
        includes(:vehicles).where.not(vehicles: {id: nil})
    end
end
