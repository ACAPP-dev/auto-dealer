class Make < ApplicationRecord
    has_many :vehicles

    scope :vehicle_makes, -> { includes(:vehicles).where.not(vehicles: {id: nil})}

end
