class VehiclesController < ApplicationController
    before_action :find_vehicle, only: [:show]

    def index
        if !params[:search].blank?
            @vehicles = Vehicle.search_vehicle(params[:search].downcase)
        elsif !params[:make].blank?
            @vehicles = Vehicle.by_make(params[:make])
        elsif !params[:carname].blank?
            @vehicles = Vehicle.by_model(params[:carname])
        elsif !params[:order_by].blank?
            case params[:order_by]
            when 'price'
                @vehicles = Vehicle.order_by_price
            when 'make'
                @vehicles = Vehicle.order_by_make
            when 'year'
                @vehicles = Vehicle.order_by_year
            else
                @vehicles = Vehicle.all
            end
        elsif !params[:select].blank?
            if params[:select] == 'older'
                @vehicles = Vehicle.older
            elsif params[:select] == 'newer'
                @vehicles = Vehicle.newer
            end
        else
            @vehicles = Vehicle.all
        end
        @makes = Make.vehicle_makes
        @carnames = Carname.vehicle_models
    end

    def show
        @options = @vehicle.options.split(", ")
    end

    private

    def find_vehicle
        @vehicle = Vehicle.find(params[:id])
    end

end
