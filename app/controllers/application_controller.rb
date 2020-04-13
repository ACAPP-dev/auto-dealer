class ApplicationController < ActionController::Base

    def home
        render :'/home'
    end

    
    def get_customer
        if session[:user_id]
           @customer || @customer = Customer.find(session[:user_id])
        else
            @customer = nil
        end
    end

    def valid_customer?
        if get_customer
            @customer.id == session[:user_id]
        end
    end

    def nested_valid_customer?(cust_id)
        cust_id == session[:user_id]
    end

    def get_employee
        if session[:user_id]
           @employee || @employee = Employee.find(session[:user_id])
        else
            @employee = nil
        end
    end

    def valid_employee?
        if get_employee
            @employee.id == session[:user_id]
        end
    end
end
