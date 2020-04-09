class VehiclesController < ApplicationController
    before_action :find_vehicle, only: [:show, :edit, :update, :destroy]

    def index
        #binding.pry
        if !params[:search].blank?
            @vehicles = Vehicle.all.select{|vehicle| vehicle.vehicle_search.downcase.include?(params[:search].downcase)}
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
        else
            @vehicles = Vehicle.all
        end
        @makes = Make.vehicle_makes
        @carnames = Carname.vehicle_models
    end

    def new
        @vehicle = Vehicle.new
        @vehicle.build_make
        @vehicle.build_carname
        @makes = Make.all
        @carnames = Carname.all
        10.times do 
            @vehicle.photos.build 
        end
    end

    def create
        #raise params.inspect
        #binding.pry
        @vehicle = Vehicle.new(vehicle_params)
        if @vehicle.save
            redirect_to vehicle_path(@vehicle)
        else
            render :new
        end
    end

    def update
        if @vehicle.update(vehicle_params)
            redirect_to vehicle_path(@vehicle)
        else
            render :edit
        end
    end

    def destroy

    end

    def edit
        @makes = Make.all
        @carnames = Carname.all
    end

    def show
        
    end


    private

    def find_vehicle
        @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
        params.require(:vehicle).permit(
            {make_attributes: [:name]},
            {carname_attributes: [:name]},
            :year,
            :price,
            :doors,
            :body_style,
            :vin,
            :transmission,
            :description,
            :drivetrain,
            :fuel_type,
            :mileage,
            :ext_color,
            :int_color,
            :mileage_city,
            :mileage_hwy,
            :type,
            :options,
            :sold,
            {photos_attributes: [:id, :description, :link_to_photo]})
    end
end
