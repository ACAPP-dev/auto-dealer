class Make < ApplicationRecord
    has_many :vehicles
    #has_many :carnames

    def self.vehicle_makes
        binding.pry
        @makes = Make.where.not(vehicle_id: nil).take

    end


end
