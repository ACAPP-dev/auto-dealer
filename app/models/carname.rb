class Carname < ApplicationRecord
    #belongs_to :make
    has_many :vehicles

    def self.vehicle_models
        includes(:vehicles).where.not(vehicles: {id: nil})
    end
end
