class Admin::SessionsController < ApplicationController
    layout 'admin'
    
    def new
    end

    def create
        @employee = Employee.find_by(email: params[:email])
        if @employee && @employee.validate(params[:password])
            session[:empl_id] = @employee.id 
            redirect_to admin_menus_path, message: "Login Successful!"
        else
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to admin_menus_path
    end

end
