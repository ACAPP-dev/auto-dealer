class Admin::VehiclesController < ApplicationController
    layout 'admin'

    before_action :find_vehicle, only: [:show, :edit, :update, :destroy]

    def index
        @vehicles = Vehicle.all
        @makes = Make.vehicle_makes
        @carnames = Carname.vehicle_models
    end

    def new
        if !valid_employee?
            redirect_to admin_login_path, alert: "Please Login to add vehicles!"
        else
            if @employee.access_level < 200
                redirect_to admin_employees_path, alert: "You do not have access to add vehicles!"
            end
        end
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
        
        @vehicle = Vehicle.new(vehicle_params)
        if @vehicle.save
            redirect_to vehicle_path(@vehicle), notice: "Vehicle was created!"
        else
            @makes = Make.all
            @carnames = Carname.all
            render :'new'
        end
    end

    def update
        if @vehicle.update(vehicle_params)
            redirect_to admin_vehicle_path(@vehicle), notice: "Updates were saved!!"
        else
            @makes = Make.all
            @carnames = Carname.all
            render :edit
        end
    end

    def destroy
        if !valid_employee?
            redirect_to admin_login_path, alert: "Please Login to delete vehicles!"
        elsif
            if @employee.access_level < 300
                redirect_to admin_vehicles_path, alert: "You do not have access to delete vehicles!"
            end
        else
            if @vehicle.delete
                redirect_to admin_vehicles_path, notice: "Vehicle successfully deleted!"
            else
                redirect_to admin_vehicles_path, alert: "Unable to delete vehicle."
            end
        end
    end

    def edit
        if !valid_employee?
            redirect_to admin_login_path, alert: "Please Login to edit vehicles!"
        else
            if @employee.access_level < 200
                redirect_to admin_vehicles_path, alert: "You do not have access to edit vehicles!"
            end
        end
        @makes = Make.all
        @carnames = Carname.all
        2.times do 
            @vehicle.photos.build 
        end
    end

    def show
        @options = @vehicle.options.split(", ")
    end


    private

    def find_vehicle
        @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
        params.require(:vehicle).permit(
            :make_id,
            {make_attributes: [:name]},
            :carname_id,
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

