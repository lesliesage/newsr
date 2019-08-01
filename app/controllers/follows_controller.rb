class FollowsController < ApplicationController
    before_action :authorized

    def create
        @new_followee_id = follow_params[:followee_id]
        Follow.find_or_create_by(follower_id: current_user.id, followee_id: @new_followee_id)
        redirect_to user_path(@new_followee_id)
    end

    def destroy
        @followee = User.find(follow_params[:followee_id])
        Follow.find_by(follower_id: current_user.id, followee_id: @followee.id).destroy
        redirect_to user_path(@followee.id)
    end

    private

    def follow_params
        params.require(:follow).permit(:followee_id)
    end
end
