class SessionsController < ApplicationController
    def new
    end

    def create
        @customer = Customer.find_by(email: params[:email])
        #binding.pry
        if @customer && @customer.validate(params[:password])
            session[:user_id] = @customer.id 
            redirect_to root_path
        else
            render :new
        end
    end

    def destroy
        session.delete('user_id')
        redirect_to root_path
    end
end
