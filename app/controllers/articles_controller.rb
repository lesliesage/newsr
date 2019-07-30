class ArticlesController < ApplicationController
    before_action :authorized

    def show
        @article = Article.find(params[:id])
    end
end
