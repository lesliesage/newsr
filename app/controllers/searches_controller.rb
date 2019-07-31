class SearchesController < ApplicationController
  before_action :authorized
  
  def new
    @search = Search.new
  end

  def create

    @search = Search.create(search_params)
  
    @articles = Article.all.select do |article|
      scrubbed(article.title + article.blurb).include?(scrubbed(@search.original_text))  
    end
    render :results

  end

  private

  def search_params
    # params[:original_text] = scrubbed(params[:original_text])
    params.require(:search).permit(:original_text, :search_date)
  end

  def scrubbed(string)
    string.gsub(/[!@#$%^&*()-=_+|;':",.<>?']/, '').split(" ").join(" ").downcase
  end

end
