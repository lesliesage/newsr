class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :current_firstname
    helper_method :current_username
    helper_method :most_popular_article
    helper_method :most_popular_user
    helper_method :most_popular_search_term
    helper_method :most_prolific_friender

    def current_user
        current_user = User.find_by(id: session[:user_id])
    end

    def current_firstname
        current_user.first_name
    end

    def current_username
        current_user.username
    end

    def logged_in?
      !!current_user
    end

    def authorized
      redirect_to login_path unless logged_in?
    end

    def most_popular_article
      Article.find(superlative_calculator(Article.all, Favorite.all.map{|favorite| favorite.article_id}))
    end

    def most_popular_user
      User.find(superlative_calculator(User.all, Follow.all.map{|follow| follow.followee_id}))
    end

    def most_popular_search_term
      unique_terms = Search.all.map{|search| search.original_text}.uniq
      hash = {}
      unique_terms.map{|term| hash[term] = Search.all.map{|search| search.original_text}.count(term)}

      # Search.find(superlative_calculator(Search.all, Search.all.map{|search| search.original_text}))
      # byebug
      #
      # hash = {}
      # Search.all.map{|search| hash[search.original_text] = array_of_object_ids_from_join_table.count(object.original_text)}
      hash.max_by{|k,v| v}[0]
    end

    def most_prolific_friender
      User.find(superlative_calculator(User.all, Follow.all.map{|follow| follow.follower_id}))
    end

    def superlative_calculator(objects, array_of_object_ids_from_join_table)
      hash = {}
      objects.map{|object| hash[object.id] = array_of_object_ids_from_join_table.count(object.id)}
      hash.max_by{|k,v| v}[0]
    end

    def stats
      render :stats
    end
end
