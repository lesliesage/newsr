class SearchesController < ApplicationController
  before_action :authorized
  include SearchesHelper

  def new
      @search = Search.new
  end

  def create
      @search = Search.create(search_params)
      @search_terms = scrubbed(search_params[:original_text])
      @search_date = search_params[:search_date]
      @articles = articles_hash(@search_terms, @search_date)
      @user = params[:id]
      session[:search_terms] = @search_terms
      session[:search_date] = @search_date
      render :results
  end

  private

  def search_params
      params.require(:search).permit(:original_text, :search_date)
  end

  def articles_hash(search_terms, search_date)
      url = "https://newsapi.org/v2/everything?q=#{search_terms}&from=#{search_date}&sortBy=popularity&apiKey=#{ENV["API_KEY"]}"
      response = RestClient.get(url, {accept: :json})
      json = JSON.parse(response)
      json["articles"]
  end
end
