class Vehicle < ApplicationRecord
    belongs_to :make
    belongs_to :carname
    has_many :photos
    has_one :vehicle_sale

    accepts_nested_attributes_for :make
    accepts_nested_attributes_for :carname
    accepts_nested_attributes_for :photos, reject_if: proc {|field| field[:link_to_photo].blank?}

    def self.search_vehicle(search)
        where("vehicle_search LIKE ?", "%#{search}%")
    end
    
    def self.by_make(make_id)
        where(make: make_id)
    end

    def self.by_model(model_id)
        where(carname: model_id)
    end

    def self.order_by_price
        order(price: :asc)
    end

    def self.order_by_make
        joins(:make).merge(Make.order(name: :asc))
    end

    def self.order_by_year
        order(year: :desc)
    end
end
