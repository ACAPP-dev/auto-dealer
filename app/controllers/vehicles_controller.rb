class VehiclesController < ApplicationController
    before_action :find_vehicle, only: [:show]

    def index
        if !params[:search].blank?
            @vehicles = Vehicle.search_vehicle(params[:search].downcase).not_sold
        elsif !params[:make].blank?
            @vehicles = Vehicle.by_make(params[:make]).not_sold
        elsif !params[:carname].blank?
            @vehicles = Vehicle.by_model(params[:carname]).not_sold
        elsif !params[:order_by].blank?
            case params[:order_by]
            when 'price'
                @vehicles = Vehicle.order_by_price.not_sold
            when 'make'
                @vehicles = Vehicle.order_by_make.not_sold
            when 'year'
                @vehicles = Vehicle.order_by_year.not_sold
            else
                @vehicles = Vehicle.not_sold
            end
        elsif !params[:select].blank?
            if params[:select] == 'older'
                @vehicles = Vehicle.older.not_sold
            elsif params[:select] == 'newer'
                @vehicles = Vehicle.newer.not_sold
            end
        else
            @vehicles = Vehicle.not_sold
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
