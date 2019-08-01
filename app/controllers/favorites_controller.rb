class FavoritesController < ApplicationController
    before_action :authorized

    def create
        if create_single_fave.id.nil?
            # store the current users set of faves
            starting_faves = []
            current_user.articles.each {|article|
                starting_faves << article
            }
            # delete the current users' faves
            current_user.articles = []
            # store all the articles presented to current user on another user's page
            presented_faves = User.find(params[:id]).articles
            # make an empty array to store the user's selections from that page
            selected_faves = []
            # put their selections into that array
            favorite_params[:article_ids].each {|id|
                selected_faves << Article.find(id)
            }
            # the current user's faves should be:
            final_set_of_faves = (starting_faves - presented_faves) | selected_faves
            # shovel each fave into current_user.articles
            final_set_of_faves.each {|fave|
                current_user.articles << fave
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
