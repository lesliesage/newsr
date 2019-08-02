class Admin::BaseController < ApplicationController
    
    before_filter :ensure_admin_user!


    def  ensure_admin_user!
            unless current_user and current_user.admin?
                redirect_to login_path
            end
    end



end
