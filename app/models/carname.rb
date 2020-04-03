class Carname < ApplicationRecord
    #belongs_to :make
    has_many :vehicles
end
