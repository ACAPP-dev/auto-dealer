class VehiclesController < ApplicationController
    before_action :find_vehicle, only: [:show, :edit, :update, :destroy]

    def index
        @vehicles = Vehicle.all
    end

    def new
        @vehicle = Vehicle.new
        @vehicle.build_make
        @vehicle.build_carname
        @makes = Make.all
        @carnames = Carname.all
    end

    def create
        raise params.inspect
    end

    def update

    end

    def destroy

    end

    def edit

    end

    def show
        
    end


    private

    def find_vehicle
        @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
        params.require(:vehicle).permit(:description, :price)
    end
end
