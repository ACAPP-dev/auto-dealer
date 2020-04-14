class Admin::SessionsController < ApplicationController
    layout 'admin'
    
    def new
    end

    def create
        @employee = Employee.find_by(email: params[:email])
        if @employee && @employee.authenticate(params[:password])
            session[:empl_id] = @employee.id 
            redirect_to admin_menus_path, message: "Login Successful!"
        else
            redirect_to admin_login_path, alert: "Invalid email or password!"
        end
    end

    def destroy
        session.delete(:empl_id)
        redirect_to admin_menus_path, message: "Logout Successful!"
    end

end
