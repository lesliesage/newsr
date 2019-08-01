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
            # qr = RQRCode::QRCode.new(@user.google_secret_value )
            session[:user_id] = @user.id

            redirect_to '/'
        else
            redirect_to '/signup'
        end
    end

    qrcode = RQRCode::QRCode.new("http://github.com/")




    def homepage
        # @qr = RQRCode::QRCode.new(current_user.google_secret_value, :size => 4, :level => :h )
        # @qr = RQRCode::QRCode.new("http://codingricky.com").to_img.resize(200, 200).to_data_url
        #@qr = RQRCode::QRCode.new("https://chart.googleapis.com/chart?cht=qr&chl=otpauth%3A%2F%2Ftotp%2Fqrtester%3Fsecret%3Dhnjxvy23exa24sze&chs=200x200", :size => 10, :level => :h )
        @qr = RQRCode::QRCode.new("otpauth://totp/Newsr?secret=#{current_user.google_secret_value}")
        @current_user
        @current_firstname
        @current_username
        @search = Search.new
        render 'homepage'
    end
    #otpauth://totp/qrtester:?secret=hnjxvy23exa24sze&issuer=qrtester
    
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
        params.require(:user).permit(:first_name, :last_name, :password, :username, :articles => [])
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
