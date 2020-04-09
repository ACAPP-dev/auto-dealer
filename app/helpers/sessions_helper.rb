module SessionsHelper
    def logged_in?
        !!current_customer
    end

    def current_customer
        @customer = Customer.find_by(id: session[:user_id])
    end
end
