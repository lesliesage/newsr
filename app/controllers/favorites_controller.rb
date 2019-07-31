class FavoritesController < ApplicationController
    before_action :authorized

    def create
        if create_single_fave.id.nil?
            current_user.articles = []
            favorite_params[:article_ids].each {|id|
                current_user.articles << Article.find(id)
            }
            redirect_to user_path(params[:id])
        else
            redirect_to article_path(single_favorite_params[:article_id])
        end
    end

    def create_single_fave
        Favorite.find_or_create_by(user_id: current_user.id, article_id: single_favorite_params[:article_id])
    end

    def create_and_save
        search_terms = session[:search_terms]
        search_date = session[:search_date]
        full_set = articles_hash(search_terms, search_date)
        new_articles_params[:articles].each do |title|
            complete_deets = full_set.find{|article| article["title"] == title}
            blurb = complete_deets["description"]
            url = complete_deets["url"]
            img_url = complete_deets["urlToImage"]
            @new_article = Article.find_or_create_by(title: title, blurb: blurb, url: url, img_url: img_url)
            current_user.articles << @new_article
        end
        redirect_to root_path
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

    def new_articles_params
        params.require(:favorite).permit(articles: [])
    end

    def articles_hash(search_terms, search_date)
        url = "https://newsapi.org/v2/everything?q=#{search_terms}&from=#{search_date}&sortBy=popularity&apiKey=#{ENV["API_KEY"]}"
        response = RestClient.get(url, {accept: :json})
        json = JSON.parse(response)
        json["articles"]
    end
end
