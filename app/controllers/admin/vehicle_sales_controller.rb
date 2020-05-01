class Admin::VehicleSalesController < ApplicationController

    def new
        @sale = VehicleSale.new
        @vehicles = Vehicle.not_sold
        @customers = Customer.all
        @employees = Employee.all
    end

    def index
        @vehicles = Vehicle.sold
    end

    def show

    end

    def create
        #binding.pry
        @selected_employee = Employee.find(params[:vehicle_sale][:employee_id])
        @selected_customer = Customer.find(params[:vehicle_sale][:customer_id])
        @selected_vehicle = Vehicle.find(params[:vehicle_sale][:vehicle_id])

        if @selected_employee
            #binding.pry
            @sale = @selected_employee.vehicle_sales.build(sale_params)
            @sale.customer = @selected_customer
            @sale.vehicle = @selected_vehicle
            if @sale.save
                @selected_vehicle.sold = true
                @selected_vehicle.save
                redirect_to admin_vehicle_sales_path, notice: "Vehicle Sale Recorded!!"
            else
                render :new, alert: "Unable to Record Sale!"
            end
        else
            render :new, alert: "Unable to Look Up Employee"
        end
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private
    
    def sale_params
        params.require(:vehicle_sale).permit(:vehicle_id, :customer_id, :employee_id, :price, :cost, :sale_date, :note)
    end
end
