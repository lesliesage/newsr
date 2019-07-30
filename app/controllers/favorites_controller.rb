class FavoritesController < ApplicationController
    before_action :authorized

    def create
      current_user.articles = []
      favorite_params[:article_ids].each do |id|
        current_user.articles << Article.find(id)
      end
      redirect_to '/'
    end

    private

    def favorite_params
      params.require(:favorite).permit(article_ids: [])
    end
end
