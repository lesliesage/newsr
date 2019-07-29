class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :current_firstname
    helper_method :current_username

    def current_user
        current_user = User.find_by(id: session[:user_id])
    end

    def current_firstname
        current_user.first_name
    end

    def current_username
        current_user.username
    end
end
