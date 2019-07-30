class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create, :show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to '/'
        else
            redirect_to '/signup'
        end
    end

    def homepage
        @current_user
        @current_firstname
        @current_username
        @search = Search.new
        render 'homepage'
    end

    def show
        if current_user
        # needs to show searched-for user, not logged in user
            @user = User.find(params[:id])
        else
          redirect_to '/login'
        end
    end

    def edit

    end

    def destroy
      current_user.destroy
      redirect_to '/signup'
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :password, :username, :private?)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end
