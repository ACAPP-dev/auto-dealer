class Admin::EmployeesController < ApplicationController
        
    layout 'admin'

    before_action :get_employee, only: [:show, :edit, :update, :destroy]
    # get_emplolyee method is in application_controller
    #before_action :skip_password_attribute, only: :update

    def new
        @employee = Employee.new
    end

    def index
        @employees = Employee.all 
    end

    def create
        binding.pry
        @employee = Employee.new(empl_params)
        if @employee.save
            session[:empl_id] = @employee.id
            redirect_to admin_employee_path(@employee), notice: "Successfully Created Account!"
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if valid_employee?
            if @employee.update(skip_password_attribute)
                redirect_to admin_employee_path(@employee), notice: "Successfully Updated Account!"
            else
                render :edit

            end
        else
            redirect_to admin_login_path, alert: "Please login to update your account."
        end
    end

    def destroy
    end

    private

    def skip_password_attribute
        if params[:employee][:password].blank? && params[:employee][:password_confirmation].blank?
            empl_params.except(:password, :password_confirmation)
        else
            empl_params
        end
    end

    def empl_params
        params.require(:employee).permit(:name, :address, :city, :state, :zip, :email, :password, :password_confirmation, :phone, :emp_type, :access_level)
    end  
    end

