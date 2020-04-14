class SessionsController < ApplicationController
    def new
    end

    def create
        @customer = Customer.find_by(email: params[:email])
        if @customer && @customer.authenticate(params[:password])
            session[:user_id] = @customer.id 
            redirect_to root_path, message: "Login Successful!"
        else
            redirect_to login_path, alert: "Invalid email or password"
        end
    end

    def create_fb
        @customer = Customer.find_or_create_by(uid: auth['uid']) do |c|
            c.name = auth['info']['name']
            c.email = auth['info']['email']
            random_password = SecureRandom.base64(15)
            c.password = random_password
            c.password_confirmation = random_password
        end
        session[:user_id] = @customer.id
        redirect_to root_path
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end
