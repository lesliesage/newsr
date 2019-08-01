class SessionsController < ApplicationController
    before_action :authorized, only: [:destroy]

    def new
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password]) && @user.google_authentic?(params[:authenticator_code])
            session[:user_id] = @user.id
            redirect_to '/'
        else
            flash[:notice] = "invalid credentials"
            render :new
        end
    end

    def destroy
        reset_session
        redirect_to '/login'
    end
end
