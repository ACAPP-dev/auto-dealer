class AppointmentsController < ApplicationController
    
    #before_action :get_customer, only: [:new, :index, :show, :edit, :update, :destroy]
    # get_customer method is in application_controller

   before_action :get_appointment, only: [:show, :edit, :update, :destroy]

    def new
        if nested_valid_customer?(params[:customer_id].to_i)
            @appointment = get_customer.appointments.build(appt_type: params[:appt_type], appt_time: Time.new(2000))
            @employees = Employee.all
        else
            redirect_to root_path, alert: "Please login to make an appointment."
        end
    end

    def create
        if nested_valid_customer?(params[:customer_id].to_i)
            @appointment = get_customer.appointments.build(appt_params)
            if @appointment.save
                redirect_to customer_appointments_path(@appointment.customer), notice: "Successfully created appointment!"
            else
                @employees = Employee.all
                render :new
            end
        else
            redirect_to root_path, alert: "Please login to make an appointment."
        end
    end

    def index
        if nested_valid_customer?(params[:customer_id].to_i)
            @appointments = get_customer.appointments.all
        else
            flash.now[:alert] = "Test - NEED TO LOGIN"
            redirect_to login_url, alert: "Please login to view appointments."
        end
    end

    def show
        if !nested_valid_customer?(params[:customer_id].to_i) ||
            !get_customer.appointments.include?(@appointment)
            redirect_to root_path, alert: "Please login to view appointments."
        end
    end

    def edit 
        if nested_valid_customer?(params[:customer_id].to_i)
            get_customer
            @employees = Employee.all
            if !@appointment = @customer.appointments.find_by(id: params[:id])
               redirect_to root_path, alert: "Please login to change appointments."
            end
        else
            redirect_to root_path, alert: "Please login to change appointments."
        end
    end

    def update
        if nested_valid_customer?(@appointment.customer_id) &&
            get_customer.appointments.include?(@appointment)
            if @appointment.update(appt_params)
                redirect_to customer_appointment_path(get_customer.id, @appointment), notice: "Successfully updated appointment!"
            else
                @employees = Employee.all
                render :'edit'
            end
        else
            redirect_to root_path, alert: "Please login to change appointments."
        end
    end

    def destroy
        if nested_valid_customer?(@appointment.customer_id) &&
            get_customer.appointments.include?(@appointment)
            if @appointment.delete
                redirect_to customer_appointments_path(get_customer.id), notice: "Your appointment was successfully cancelled."
            else
                redirect_to root_path, alert: "Please login to cancel appointments."
            end
        end
    end


   
    private
    
    def get_appointment
        @appointment = Appointment.find_by(id: params[:id].to_i)
    end

    def appt_params
        params.require(:appointment).permit(:appt_type, :description,
            :appt_date, :appt_time, :employee_id)
    end
end
