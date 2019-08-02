class UsersController < ApplicationController
    before_action :authorized, only: [:homepage, :show, :edit, :update, :destroy, :search, :show_search]
    helper_method :user_search_results

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            @user.set_google_secret
            session[:user_id] = @user.id
            redirect_to '/qr'
        else
            redirect_to '/signup'
        end
    end

    def qr_page
        @qr = RQRCode::QRCode.new("otpauth://totp/Newsr?secret=#{current_user.google_secret_value}")
        render :qr
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
            if current_user.id.to_s == params[:id]
                redirect_to root_path
            else
                @user = User.find(params[:id])
            end
        else
          redirect_to '/login'
        end
    end

    def edit
        @user = current_user
    end

    def update
        if current_user.update(user_params)
            redirect_to root_path
        else
            @user = current_user
            @test_user = User.create(user_params)
            render :edit
        end
    end

    def show_search
        render :search
    end

    def search
        @users = User.get_searched_users(params[:q])
        render :search
    end

    def destroy
        current_user.destroy
        redirect_to '/signup'
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :password, :username, :articles => [])
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
