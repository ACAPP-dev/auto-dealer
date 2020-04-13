class Admin::MenusController < ApplicationController
    layout 'admin'

    def index
        if !valid_employee?
            redirect_to admin_login_path, alert: "Please Login to Access Admin Menu"
        end
    end
end
