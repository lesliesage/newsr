
class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :current_firstname
    helper_method :current_username
    helper_method :most_popular_article
    helper_method :most_popular_user
    helper_method :most_popular_search_term
    helper_method :most_prolific_friender
    before_action :authorized, only: [:stats]
    require 'rqrcode_core'
    require 'rqrcode'

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







    private
    def check_mfa
       if !(user_mfa_session = UserMfaSession.find) && (user_mfa_session ? user_mfa_session.record == current_user : !user_mfa_session)
        redirect_to new_user_mfa_session_path
      end
    end
end
