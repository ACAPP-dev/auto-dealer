class Admin::AppointmentsController < ApplicationController
    layout 'admin'

    before_action :get_employee, only: [:new, :create]

    def new
        #binding.pry
        @appointment = @employee.appointments.build(appt_time: Time.new(2000))
        @customers = Customer.all
    end

    def create
        if !valid_employee?
            redirect_to admin_login_path, alert: "Please Login to create appointments!"
        else
            @appointment = @employee.appointments.build(appt_params)
            #binding.pry
            if @appointment.save
                redirect_to admin_appointments_path, notice: "Appointment successfully created!"
            else
                @customers = Customer.all
                render :new
            end
        end
    end


    def index
        if !valid_employee?
            redirect_to admin_login_path, alert: "Please Login to view appointments!"
        end
        @appointments = Appointment.order_by_date
    end

    def destroy
        if !valid_employee?
            redirect_to admin_login_path, alert: "Please Login to delete appointments!"
        elsif
            if @employee.access_level < 300
                redirect_to admin_appointments_path, alert: "You do not have access to delete appointments!"
            end
        else 
            @appointment = Appointment.find(params[:id])
            if @appointment.delete
                redirect_to admin_appointments_path, notice: "Appointment successfully deleted."
            else
                redirect_to admin_appointments_path, alert: "Unable to delete appointment."
            end
        end
    end
    private

    def appt_params
        params.require(:appointment).permit(:description, :appt_type, :employee_id, :customer_id, :appt_date, :appt_time)
    end
end



