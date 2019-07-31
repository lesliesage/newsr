class UsersController < ApplicationController
    before_action :authorized, only: [:homepage, :show, :edit, :update, :destroy]
    helper_method :user_search_results

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
            @user.set_google_secret
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
            @user = User.find(params[:id])
        else
          redirect_to '/login'
        end
    end

    def edit

    end

    def update

        current_user.update()
    end

    def show_search
        render :search
    end

    def search
        q = params[:q].downcase.strip
        @users = User.all.select do |user|
          user.first_name.downcase.include?(q) || user.last_name.downcase.include?(q) || user.username.downcase.include?(q)
        end
        render :search
    end

    def destroy
      current_user.destroy
      redirect_to '/signup'
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :password, :username, :private?, :articles => [])
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
