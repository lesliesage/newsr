class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_firstname
  helper_method :current_username
  # before_filter :check_mfaa.sal
  
    def current_user
        current_user = User.find_by(id: session[:user_id])
    end

    def current_firstname
        current_user.first_name
    end

    def current_username
        current_user.username
    end

    def logged_in?
      !!current_user
    end

    def authorized
      redirect_to login_path unless logged_in?
    end



    private
    def check_mfa
       if !(user_mfa_session = UserMfaSession.find) && (user_mfa_session ? user_mfa_session.record == current_user : !user_mfa_session)
        redirect_to new_user_mfa_session_path
      end
    end
end
