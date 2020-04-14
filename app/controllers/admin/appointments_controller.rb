class Admin::AppointmentsController < ApplicationController
    layout 'admin'

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
end
