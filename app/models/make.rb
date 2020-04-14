class Make < ApplicationRecord
    has_many :vehicles

    def self.vehicle_makes
        includes(:vehicles).where.not(vehicles: {id: nil})
    end

end
