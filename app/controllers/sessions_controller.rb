class SessionsController < ApplicationController
before_action :authorized, only: [:destroy]
    def new
    end

    def create
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password]) && @user.google_authentic?(123456)
          session[:user_id] = @user.id
          redirect_to '/'
      else
          flash[:notice] = "invalid credentials" #use in an error div
          render :new
      end
    end

    def destroy
        reset_session
        redirect_to '/login'
    end
end
