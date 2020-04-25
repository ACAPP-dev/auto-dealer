class Admin::AppointmentsController < ApplicationController
    layout 'admin'

    before_action :get_employee, only: [:new, :create, :edit, :update]

    def new
        if @employee.access_level < 200
            redirect_to admin_menus_path, alert: 'You do not have access to create an appointment!'
        else
            @appointment = @employee.appointments.build(appt_time: Time.new(2000))
            @customers = Customer.all
            @employees = Employee.all
        end
    end

    def create
        if !valid_employee?
            redirect_to admin_login_path, alert: "Please Login to create appointments!"
        else
            @selected_employee = Employee.find(params[:appointment][:employee_id].to_i)
            @appointment = @selected_employee.appointments.build(appt_params)
            if @appointment.save
                redirect_to admin_appointments_path, notice: "Appointment successfully created!"
            else
                @customers = Customer.all
                @employees = Employee.all
                render :new
            end
        end
    end

    def edit
        if !valid_employee?
            redirect_to admin_login_path, alert: 'Please login to edit appointments!'
        else
            if @employee.access_level < 200
                redirect_to admin_menus_path, alert: "You do not have access to create an appointment!"
            else
                @appointment = Appointment.find(params[:id])
                @customers = Customer.all
                @employees = Employee.all
            end
        end
    end

    def update
        if !valid_employee?
            redirect_to admin_login_path, alert: "Please Login to create appointments!"
        else
            #@selected_employee = Employee.find(params[:appointment][:employee_id].to_i)
            @appointment = Appointment.find(params[:id])
            if @appointment.update(appt_params)
                redirect_to admin_appointments_path, notice: "Appointment successfully updated!"
            else
                @customers = Customer.all
                @employees = Employee.all
                render :edit
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



