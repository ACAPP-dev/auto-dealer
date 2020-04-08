class CustomersController < ApplicationController

    before_action :get_customer, only: [:show, :edit, :update, :destroy]
    # get_customer method is in application_controller
    
    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(cust_params)
        if @customer.save
            session[:user_id] = @customer.id
            redirect_to root_path
        else
            render :signup
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    

    def cust_params
        params.require(:customer).permit(:name, :address, :city, :state, :zip, :email, :password, :password_confirmation, :phone)
    end
end
