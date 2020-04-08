class Vehicle < ApplicationRecord
    belongs_to :make
    belongs_to :carname
    has_many :photos
    has_one :vehicle_sale

    accepts_nested_attributes_for :make
    accepts_nested_attributes_for :carname
    accepts_nested_attributes_for :photos, reject_if: proc {|field| field[:link_to_photo].blank?}

    
end
