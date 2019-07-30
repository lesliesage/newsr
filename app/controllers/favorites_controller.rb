class FavoritesController < ApplicationController
    before_action :authorized

    def create
        if create_single_fave
        else
            current_user.articles = []
            favorite_params[:article_ids].each do |id|
                current_user.articles << Article.find(id)

            end
            redirect_to article_path
        end
    end

    def create_single_fave
           Favorite.find_or_create_by(user_id: current_user.id, article_id: single_favorite_params[:article_id])
           redirect_to article_path(single_favorite_params[:article_id])
    end


    def destroy
        @article = Article.find(params[:id])
        Favorite.find_by(user_id: current_user.id, article_id: @article.id).destroy
        redirect_to article_path
    end



    private

    def single_favorite_params
        params.require(:favorite).permit(:article_id)
    end

    def favorite_params
      params.require(:favorite).permit(article_ids: [])
    end
end
