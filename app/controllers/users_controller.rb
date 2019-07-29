class UsersController < ApplicationController


    def new
        @user = User.new
    end


    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end
    end

    def show
        @user = User.find(params[:id])

    end

    def edit
    end

    def destroy
    end

private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :password, :username, :private?)
    end


end
