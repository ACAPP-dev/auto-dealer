class CustomersController < ApplicationController

    before_action :get_customer, only: [:show, :edit, :update, :destroy]
    
    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(cust_params)
        if @customer.save
            session[:user_id] = @customer.id
            redirect_to customer_path(@customer), notice: "Successfully Created Account!"
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if valid_customer?
            if @customer.update(skip_password_attribute)
                redirect_to customer_path(@customer), notice: "Successfully Updated Account!"
            else
                render :edit
            end
        else
            redirect_to root_path, alert: "Please login to update your account."
        end
    end

    def destroy
    end

    private

    def skip_password_attribute
        if params[:customer][:password].blank? && params[:customer][:password_confirmation].blank?
            cust_params.except(:password, :password_confirmation)
        else
            cust_params
        end
    end
    
    def cust_params
        params.require(:customer).permit(:name, :address, :city, :state, :zip, :email, :password, :password_confirmation, :phone)
    end  
end
