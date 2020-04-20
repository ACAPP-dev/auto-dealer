class Vehicle < ApplicationRecord
    belongs_to :make
    belongs_to :carname
    has_many :photos
    
    accepts_nested_attributes_for :make
    accepts_nested_attributes_for :carname
    accepts_nested_attributes_for :photos, reject_if: proc {|field| field[:link_to_photo].blank?}

    validates :price, :year, :mileage, :description, presence: true

    scope :older, -> {where("year<2000")}
    scope :newer, -> {where("year>2015")}
    scope :order_by_price, -> { order(price: :asc)}
    scope :order_by_make, -> { joins(:make).merge(Make.order(name: :asc))}
    scope :order_by_year, -> {order(year: :desc)}

    def make_attributes=(make_hash)
        unless make_hash[:name].empty?
            make_instance = Make.find_or_create_by(make_hash)
            self.make = make_instance
            self.save
        end 
    end

    def carname_attributes=(name_hash)
        unless name_hash[:name].empty?
            model_instance = Carname.find_or_create_by(name_hash)
            self.carname = model_instance
            self.save
        end 
    end
    
    def self.search_vehicle(search)
        where("vehicle_search LIKE ?", "%#{search}%")
    end
    
    def self.by_make(make_id)
        where(make: make_id)
    end

    def self.by_model(model_id)
        where(carname: model_id)
    end

    
end
