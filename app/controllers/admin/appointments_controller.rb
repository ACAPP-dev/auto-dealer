class Admin::AppointmentsController < ApplicationController
    layout 'admin'

    def index
        if !valid_employee?
            redirect_to admin_login_path, alert: "Please Login to view appointments!"
        end
        @appointments = Appointment.order_by_date
    end
end
